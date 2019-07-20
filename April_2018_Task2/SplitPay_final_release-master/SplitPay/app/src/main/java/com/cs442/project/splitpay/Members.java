package com.cs442.project.splitpay;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.FragmentManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.support.v7.app.ActionBarActivity;
import android.telephony.SmsManager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.provider.ContactsContract.CommonDataKinds.Phone;

import com.firebase.client.Firebase;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Members extends ActionBarActivity{
    private Integer id;
    private String memberName;
    private String groupName1;
    private String groupName;
    private double amountPayed;
    private String itemName;
    private String paymentStatus;
    final Context context = this;
    private StoreDbHandler storeDbHandler;
    private String name;
    public static final int PICK_CONTACT = 1;
    private List<Item> items = new ArrayList<Item>();
    private ItemAdapter itemAdapter;
    private ArrayAdapter<Item> listAdapter ;
    Firebase ref;

    ListView listView;
    ArrayAdapter<String> grpMembersAdapter;
    List<String> grpMembers = new ArrayList<String>();

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public ItemAdapter getItemAdapter() {
        return itemAdapter;
    }

    public void setItemAdapter(ItemAdapter itemAdapter) {
        this.itemAdapter = itemAdapter;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public double getAmountPayed() {
        return amountPayed;
    }

    public void setAmountPayed(double amountPayed) {
        this.amountPayed = amountPayed;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
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
        setContentView(R.layout.mem_details);
        android.support.v7.app.ActionBar ab = getSupportActionBar();
        ab.setDisplayShowHomeEnabled(true);
        ab.setIcon(R.drawable.ic_launcher);
        ab.setDisplayHomeAsUpEnabled(false);

        this.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        Bundle extras = getIntent().getExtras();
        groupName1 = getIntent().getExtras().getString("GROUP_NAME").trim();
        ref = new Firebase("https://luminous-torch-5174.firebaseio.com/membergroups/"+groupName1+"/");
        if(extras == null){
            System.out.println("extras is null");
        }else{
            System.out.println("grp name: " + extras.getString("GROUP_NAME"));
        }
        setGroupName(getIntent().getExtras().getString("GROUP_NAME"));
        FragmentManager fm = getFragmentManager();
        ItemListFragment itemListFragment = (ItemListFragment)fm.findFragmentById(R.id.itemListFragment);

        // Create the array list of to do items
        //TODO: read members from db
        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(),null);
        grpMembers = storeDbHandler.getMembersFromDb(getGroupName());
        Map<String, Item> itemMap = storeDbHandler.getMemberPaymentDetailsFromDb(getGroupName());
        if(grpMembers != null && !grpMembers.isEmpty()){
            for(String name : grpMembers){
                if(itemMap.containsKey(name)){
                    items.add(itemMap.get(name));
                }else{
                    Item item = new Item(false,name,0.0,0.0,0.0,0.0);
                    items.add(item);
                }
            }
        }
        // Create the array adapter to bind the array to the ListView
        int resID = R.layout.member_list_row;
        itemAdapter = new ItemAdapter(this, resID, items);

        // Bind the array adapter to the ListView.
        itemListFragment.setListAdapter(itemAdapter);
        System.out.println("member name after getmemberfrom db opration " + grpMembers.size());

        Button payButton = (Button) findViewById(R.id.pay);
        payButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!items.isEmpty()) {
                    List<Item> selectedMembers = new ArrayList<Item>();
                    for (Item item : items) {
                        if (item.getChkBox()) {
                            selectedMembers.add(item);
                        }
                    }

                    if (!selectedMembers.isEmpty()) {
                        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(), null);
                        if (storeDbHandler.makeMembersPayment(getGroupName(), selectedMembers)) {
                            Toast.makeText(context, "Payment was successful.", Toast.LENGTH_LONG).show();
                            items.clear();
                            storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(),null);
                            grpMembers = storeDbHandler.getMembersFromDb(getGroupName());
                            Map<String, Item> itemMap = storeDbHandler.getMemberPaymentDetailsFromDb(getGroupName());

                            if(grpMembers != null && !grpMembers.isEmpty()){
                                for(String name : grpMembers){
                                    if(itemMap.containsKey(name)){
                                        items.add(itemMap.get(name));
                                    }else{
                                        Item item = new Item(false,name,0.0,0.0,0.0,0.0);
                                        items.add(item);
                                    }
                                }
                            }
                            itemAdapter.notifyDataSetChanged();
                        } else {
                            Toast.makeText(context, "Error: Payment failed.", Toast.LENGTH_LONG).show();
                        }
                    }else{
                        Toast.makeText(context, "Please select at least one member first.", Toast.LENGTH_LONG).show();
                    }
                }
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
        getMenuInflater().inflate(R.menu.members_group, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.

        switch (item.getItemId()) {
            // action with ID action_refresh was selected
            case R.id.action_add_user:
                Add_New_User();
                break;
            // action with ID action_settings was selected
            case R.id.action_add_pay:
                Request_Pay_Info();
                break;
            case R.id.action_logout:
                Logout_App();
                break;
            default:
                return super.onOptionsItemSelected(item);
        }

        return true;
    }

    public void Add_New_User()
    {
        Intent intent = new Intent(Intent.ACTION_PICK, ContactsContract.Contacts.CONTENT_URI);
        startActivityForResult(intent, PICK_CONTACT);
    }

    @Override
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);

        switch(reqCode) {
            case (PICK_CONTACT) : {
                if (resCode == Activity.RESULT_OK) {
                    Uri contactData = data.getData();
                    ContentResolver cr = getContentResolver();
                    Cursor c = cr.query(contactData, null, null, null, null);
                    if(c.moveToFirst()){
                        String memberName = c.getString(c.getColumnIndexOrThrow(ContactsContract.Contacts.DISPLAY_NAME_PRIMARY));
                        String contactId = c.getString(c.getColumnIndex(ContactsContract.Contacts._ID));
                        Cursor phones = cr.query(Phone.CONTENT_URI, null,
                                Phone.CONTACT_ID + " = " + contactId, null, null);
                        String mobileNumber = "";
                        while (phones.moveToNext()) {
                            String number = phones.getString(phones.getColumnIndex(Phone.NUMBER));
                            int type = phones.getInt(phones.getColumnIndex(Phone.TYPE));
                            switch (type) {
                                case Phone.TYPE_HOME:
                                    // do something with the Home number here...
                                    break;
                                case Phone.TYPE_MOBILE:
                                    // do something with the Mobile number here...
                                    mobileNumber = number;
                                    break;
                                case Phone.TYPE_WORK:
                                    // do something with the Work number here...
                                    break;
                            }
                        }
                        phones.close();
                        System.out.println("member name is " + memberName + " and mobile number is: " + mobileNumber);
                        c.close();
                        //update view with member name

                        View view = getLayoutInflater().inflate(R.layout.member_list_row, null);
                        TextView tv = (TextView) view.findViewById(R.id.memberName);
                        tv.setText(memberName);
                        //save the new member in db
                        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(), null);
                        storeDbHandler.addGroupMember(getGroupName(), memberName, mobileNumber);
                        Membergroups mg = new Membergroups(memberName,getGroupName());
                        Firebase ref2 = new Firebase("https://luminous-torch-5174.firebaseio.com/membergroups/");
                        Map<String,Object> memgrp= new HashMap<String,Object>();
                        memgrp.put("membername",mg.getMembername()); //adding member group name and membername to firebase
                        memgrp.put("membergroup",mg.getGroupname());
                        ref2.child(""+mg.getMembername()).updateChildren(memgrp);
                        items.clear();
                        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(), null);
                        grpMembers = storeDbHandler.getMembersFromDb(getGroupName());
                        Map<String, Item> itemMap = storeDbHandler.getMemberPaymentDetailsFromDb(getGroupName());

                        if (grpMembers != null && !grpMembers.isEmpty()) {
                            for (String name : grpMembers) {
                                if (itemMap.containsKey(name)) {
                                    items.add(itemMap.get(name));
                                } else {
                                    Item item = new Item(false, name, 0.0, 0.0, 0.0, 0.0);
                                    items.add(item);
                                }
                            }
                        }
                        itemAdapter.notifyDataSetChanged();

                        System.out.println("member name afer insert into db " + name);
                    }
                }
                break;
            }
            default: break;
        }
    }

    //---sends an SMS message to another device---
    private void sendSMS(String phoneNumber, String message)
    {
        SMS sms = new SMS(phoneNumber, message);
        new Thread(sms).start();
    }

    public void Request_Pay_Info()
    {
        LayoutInflater lif = LayoutInflater.from(context);
        View promptsView = lif.inflate(R.layout.prompt_paydetails, null);

        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(context);

        // set prompts.xml to alertdialog builder
        alertDialogBuilder.setView(promptsView);
        alertDialogBuilder.setCancelable(false);

        final EditText forInput = (EditText) promptsView.findViewById(R.id.editpurpose);
        final EditText amtInput = (EditText) promptsView.findViewById(R.id.editamount);
        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setPositiveButton("SPLIT",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                String itemName = forInput.getText().toString();
                                String amount = amtInput.getText().toString();
                                Firebase ref = new Firebase("https://luminous-torch-5174.firebaseio.com/groupdetails/" + groupName1 + "/");
                                if (!items.isEmpty()) {
                                    int membersSelectedCount = 0;
                                    for (Item item : items) {
                                        if (item.getChkBox()) {
                                            membersSelectedCount++;
                                        }
                                    }

                                    if (membersSelectedCount > 0) {
                                        DecimalFormat formatter = new DecimalFormat("#.##");
                                        for (Item item : items) {
                                            if (item.getChkBox()) {
                                                double amt = Double.valueOf(amount) / membersSelectedCount;
                                                amt = Double.valueOf(formatter.format(amt));
                                                item.setPerItemAmountSpent(amt);
                                                item.setPerItemAmountOwed(0.0);
                                            } else {
                                                item.setPerItemAmountSpent(0.0);
                                                double amt = Double.valueOf(amount) / items.size();
                                                amt = Double.valueOf(formatter.format(amt));
                                                item.setPerItemAmountOwed(amt);
                                            }
                                            item.setPaymentStatus("PENDING");
                                            item.setItemName(itemName);
                                            item.setChkBox(false);
                                            MemberDetails mem = new MemberDetails(item.getMemberName(), item.getPerItemAmountOwed(), item.getPerItemAmountSpent(), item.getItemName());
                                            Map<String, Object> tes = new HashMap<String, Object>();
                                            tes.put("membername", item.getMemberName());
                                            tes.put("amountowed", item.getPerItemAmountOwed());
                                            tes.put("amountpaid", item.getPerItemAmountSpent());
                                            tes.put("itemname", item.getItemName());
                                            ref.child("" + "/" + item.getMemberName()).updateChildren(tes);
                                        }
                                        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(), null);
                                        if (storeDbHandler.saveOrUpdate(groupName, items)) {
                                            Toast.makeText(context, "Item details saved.", Toast.LENGTH_LONG).show();
                                        } else {
                                            Toast.makeText(context, "Error: Item details could not be saved.", Toast.LENGTH_LONG).show();
                                        }

                                        items.clear();
                                        storeDbHandler = StoreDbHandler.getDbHandlerInstance(getApplicationContext(), null);
                                        grpMembers = storeDbHandler.getMembersFromDb(getGroupName());
                                        Map<String, Item> itemMap = storeDbHandler.getMemberPaymentDetailsFromDb(getGroupName());

                                        if (grpMembers != null && !grpMembers.isEmpty()) {
                                            for (String name : grpMembers) {
                                                if (itemMap.containsKey(name)) {
                                                    Item item = itemMap.get(name);
                                                    items.add(item);
                                                    if (item.getTotalAmountOwed() > 0.0) {
                                                        //send text msg if the member owes money
                                                        //get member phone number
                                                        String memberPhone = storeDbHandler.getMemberPhoneFromDb(getGroupName(), name);
                                                        if (memberPhone != null && memberPhone.length() >= 10) {
                                                            String message = "The total amount you owe for the group " + getGroupName() + " is: $" + item.getTotalAmountOwed();
                                                            sendSMS(memberPhone, message);
                                                            Toast.makeText(context, "sms sent to:" + memberPhone, Toast.LENGTH_LONG).show();
                                                        }else{
                                                            System.out.println("sms not sent: member: " + name + " phone:" + memberPhone);
                                                            Toast.makeText(context, "smsNotSent:" + name + " phone:" + memberPhone, Toast.LENGTH_LONG).show();
                                                        }
                                                    }
                                                } else {
                                                    Item item = new Item(false, name, 0.0, 0.0, 0.0, 0.0);
                                                    items.add(item);
                                                }
                                            }
                                        }
                                        itemAdapter.notifyDataSetChanged();
                                    } else {
                                        Toast.makeText(context, "Please select at least one member first.", Toast.LENGTH_LONG).show();
                                    }
                                }
                            }
                        })
                .setNegativeButton("Cancel",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });
        // show it
        alertDialogBuilder.show();
    }

    public void Logout_App() {
        Intent logout=new Intent(this,LoginActivity.class);
        logout.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(logout);
        this.finish();
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