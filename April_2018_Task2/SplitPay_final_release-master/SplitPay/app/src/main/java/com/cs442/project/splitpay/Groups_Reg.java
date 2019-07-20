package com.cs442.project.splitpay;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.LinearGradient;
import android.graphics.Shader;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.ActionBar;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.os.Build;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.firebase.client.DataSnapshot;
import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;
import com.firebase.client.ValueEventListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class Groups_Reg extends ActionBarActivity {
    private String groupName;

    final Context context = this;
    private Button button;
    TextView result;
    ListView listView;
    LinearLayout mytext;
    TextView groups;
    int positionToRemove;
    ArrayAdapter<String> group_names;
    ArrayList<String> m_listItems = new ArrayList<String>();

    public Groups_Reg(){

    }
    public Groups_Reg(String groupName) {
        this.groupName = groupName;
    }

    public ListView getListView() {
        return listView;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(isTablet(this))
        {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        }
        else
        {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }

        setContentView(R.layout.groups);
        android.support.v7.app.ActionBar ab = getSupportActionBar();
        ab.setDisplayShowHomeEnabled(true);
        ab.setIcon(R.drawable.ic_launcher);
        ab.setDisplayHomeAsUpEnabled(false);

        this.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);


        button = (Button) findViewById(R.id.new_grp);
        listView = (ListView) findViewById(R.id.list);

        String username=null;
        try {
            username = getIntent().getExtras().get("username").toString();
        }catch (Exception e)
        {
            username="";
        }

        Firebase refer;


        final String finalUsername1 = username;
        final String finalUsername2 = username;
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                LayoutInflater li = LayoutInflater.from(context);
                View promptsView = li.inflate(R.layout.prompt_groupname, null);

                AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);

                alertDialogBuilder.setView(promptsView);

                final EditText userInput = (EditText) promptsView.findViewById(R.id.editTextDialogUserInput);

                final int[] getCount = {0};
                alertDialogBuilder
                        .setCancelable(false)
                        .setPositiveButton("OK",
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int id) {
                                        final String gname = userInput.getText().toString();
                                        Firebase refer;
                                        final Boolean[] endFlag = {false};
                                        refer = new Firebase("https://luminous-torch-5174.firebaseio.com/membergroups");
                                        final String finalUsername = finalUsername1;

                                                Groups_Reg groupName = new Groups_Reg();
                                                Firebase ref = new Firebase("https://luminous-torch-5174.firebaseio.com/membergroups/" + finalUsername2);
                                                GroupDetails gd = new GroupDetails(gname);
                                                Map<String, Object> grod = new HashMap<String, Object>();
                                                grod.put(gd.getGroupName(), gd.getGroupName());
                                                ref.child("/").updateChildren(grod);
                                                m_listItems.add(gname);
                                                group_names.notifyDataSetChanged();
                                    }
                                })
                        .setNegativeButton("Cancel",
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int id) {
                                        dialog.cancel();
                                    }
                                });
                // create alert dialog
                AlertDialog alertDialog = alertDialogBuilder.create();

                // show it
                alertDialog.show();
            }
        });
        // get prompts.xml view


        refer = new Firebase("https://luminous-torch-5174.firebaseio.com/membergroups");
        final String finalUsername = username;
        refer.child("/").addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot)
            {
                Map<String, Object> root = (Map<String, Object>) dataSnapshot.getValue();
                try
                {
                    Map<String, Object> newPost = (Map<String, Object>) root.get(finalUsername);
                    {
                        int TotalCount = newPost.size();
                        final ArrayList<String> groupname=new ArrayList<String>(TotalCount);
                        int i=0;
                        for (Map.Entry<String, Object> mapEntry : newPost.entrySet()) {
                            groupname.add(mapEntry.getKey());
                            i++;
                        }


                        group_names = new ArrayAdapter<String>(getApplicationContext(), R.layout.gname_list_row, R.id.list, groupname);
                        listView.setAdapter(group_names);
                        registerForContextMenu(getListView());
                        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                positionToRemove=position;
                                Intent intent = new Intent(Groups_Reg.this, Members.class);
                               // System.out.println("grp pos:" + position + " list items size:" + groupname.size() + " item:" + groupname.get(position));
                                intent.putExtra("GROUP_NAME", groupname.get(position));
                                startActivity(intent);

                                Bundle extras = intent.getExtras();
                                if (extras == null) {
                                    System.out.println("extras is null");
                                }
                            }
                        });
                    }
                } catch (Exception e) {
                    Log.d("Display", "Group Info.");
                }
            }
            @Override
            public void onCancelled(FirebaseError firebaseError) {

            }
        });
    }

    public static boolean isTablet(Context context)
    {
        return (context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK)
                >= Configuration.SCREENLAYOUT_SIZE_LARGE;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.groups, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        switch (item.getItemId()) {
            case R.id.action_logout:
                Logout_App();
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }

    public void Logout_App() {
        Intent logout=new Intent(this,LoginActivity.class);
        logout.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(logout);
        this.finish();
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo)
    {
        MenuInflater mi = getMenuInflater();
        mi.inflate(R.menu.group_menu_actions, menu);
        super.onCreateContextMenu(menu, v, menuInfo);
    }
    @Override
    public boolean onContextItemSelected(MenuItem item){
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        switch (item.getItemId()) {
            case R.id.menu_delete:
                try {
                    Log.d("Delete","position"+item.getItemId());
                    m_listItems.remove(positionToRemove);
                    group_names.notifyDataSetChanged();
                    break;
                }
                catch (Exception e)
                {
                    Log.d("Delete","Item Not deleted");
                }
        }
        return true;
    }

    @Override
    public void onBackPressed() {
        Intent startMain = new Intent(Intent.ACTION_MAIN);
        startMain.addCategory(Intent.CATEGORY_HOME);
        startMain.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(startMain);
    }

    protected void onStart() {
        super.onStart();
    }

    protected void onStop() {
        super.onStop();
    }

    protected void onResume() {
        super.onResume();
    }

    protected void onPause() {
        super.onPause();
    }

    protected void onDestroy() {
        super.onDestroy();
    }

    protected void onRestart() {
        super.onRestart();
    }
}