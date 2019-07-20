import java.util.HashMap;

public class ComposerData {
    
    private HashMap composers = new HashMap();
    

    public HashMap getComposers() {
        return composers;
    }
    
    public ComposerData() {
        
        composers.put("1", new Composer("1", "American", "Airlines", "American"));
        composers.put("2", new Composer("2", "British", "Airways", "British"));
        composers.put("3", new Composer("3", "Southwest", "Airlines", "Southwest"));
        
                              
    }

}
