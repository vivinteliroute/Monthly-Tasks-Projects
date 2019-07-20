import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Iterator;

public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private ComposerData compData = new ComposerData();
    private HashMap composers = compData.getComposers();

    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        
		
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
        	RequestDispatcher rd = request.getRequestDispatcher("error.html");
			rd.forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            if (!targetId.equals("")) {

                Iterator it = composers.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    Composer composer = (Composer) composers.get(id);

                    if ( // targetId matches first name
                         composer.getFirstName().toLowerCase().startsWith(targetId) ||
                         // targetId matches last name
                         composer.getLastName().toLowerCase().startsWith(targetId) ||
                         // targetId matches full name
                         composer.getFirstName().toLowerCase().concat(" ")
                            .concat(composer.getLastName().toLowerCase()).startsWith(targetId)) {

                        sb.append("<composer>");
                        sb.append("<id>" + composer.getId() + "</id>");
                        sb.append("<firstName>" + composer.getFirstName() + "</firstName>");
                        sb.append("<lastName>" + composer.getLastName() + "</lastName>");
                        sb.append("</composer>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<composers>" + sb.toString() + "</composers>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            // put the target composer in the request scope to display 
            if ((targetId != null) && composers.containsKey(targetId.trim())) {
           
                if(targetId.equals("1")){
                	RequestDispatcher rd = request.getRequestDispatcher("American.jsp");
        			rd.forward(request, response);
                }
                	
                else  if(targetId.equals("2") ){
                	RequestDispatcher rd = request.getRequestDispatcher("BritishAirways.jsp");
        			rd.forward(request, response);
                }
                else   if(targetId.equals("3") ){
                	RequestDispatcher rd = request.getRequestDispatcher("Southwest.jsp");
        			rd.forward(request, response);
                }
                	        		
            }
        }
    }
}
