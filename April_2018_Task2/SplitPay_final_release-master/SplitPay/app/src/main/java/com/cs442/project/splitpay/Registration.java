package com.cs442.project.splitpay;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;


import com.firebase.client.Firebase;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Registration extends ActionBarActivity {

    private String date;

    TextView mEdit;
    EditText fullname, email_id, phone_no, username, password, repassword, card_name, card_num, card_cvv;
    Button register, cancel;
    RadioGroup cardGroup;
    RadioButton cardradio;
    Spinner cardType;

    private void isEmptyField (EditText editText){
        if (editText.getText().toString().length() <= 0)
        {
            editText.setError("Mandatory Field");
        }
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

        setContentView(R.layout.register);
        Firebase.setAndroidContext(this);
        Firebase ref = new Firebase("https://splitpay.firebaseio.com");
        ActionBar ab =getSupportActionBar();
        ab.setDisplayShowHomeEnabled(true);
        ab.setIcon(R.drawable.ic_launcher);
        ab.setDisplayHomeAsUpEnabled(false);

        this.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);

        register = (Button)findViewById(R.id.reg_btn);
        cancel = (Button)findViewById(R.id.can_btn);

        fullname = (EditText)findViewById(R.id.name);
        email_id = (EditText)findViewById(R.id.email);
        phone_no = (EditText)findViewById(R.id.phone);
        username = (EditText)findViewById(R.id.uname);
        password = (EditText)findViewById(R.id.passwd);
        repassword = (EditText)findViewById(R.id.conpass);

        card_name = (EditText)findViewById(R.id.cname);
        card_num = (EditText)findViewById(R.id.cnum);
        card_cvv = (EditText)findViewById(R.id.cvv_in);
        cardGroup = (RadioGroup)findViewById(R.id.radioCard);
        cardType = (Spinner)findViewById(R.id.spinner);

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Registration userRegistration = new Registration();
                String fname = fullname.getText().toString();
                String mail = email_id.getText().toString();
                String pno = phone_no.getText().toString();
                String user_name = username.getText().toString();
                String pass = password.getText().toString();
                String confirm = repassword.getText().toString();
                int selectedId = cardGroup.getCheckedRadioButtonId();
                cardradio = (RadioButton) findViewById(selectedId);
                String Card = cardradio.getText().toString();
                String card_type = cardType.getSelectedItem().toString();
                String cardname = card_name.getText().toString();
                String cardnum = card_num.getText().toString();
                String c_cvv = card_cvv.getText().toString();

                isEmptyField(fullname);
                isEmptyField(email_id);
                isEmptyField(phone_no);
                isEmptyField(username);
                isEmptyField(password);
                isEmptyField(repassword);
                isEmptyField(card_name);
                isEmptyField(card_num);
                //isEmptyField(card_date);
                isEmptyField(card_cvv);

                if((c_cvv.length() > 0) && (c_cvv.length() < 3))
                {
                    card_cvv.setError("Incorrect CVV");
                    return;
                }

                if (!mail.matches("[a-zA-Z0-9._-]+@[a-z]+.[a-z]+"))
                {
                    email_id.setError("Incorrect Email-id");
                    return;
                }

                if(cardnum.length() < 16)
                {
                    card_num.setError("Invalid Card Number");
                    return;
                }
                if (pno.length() != 10)
                {
                    phone_no.setError("Invalid Phone Number");
                    return;
                }
                if(TextUtils.isEmpty(pass) || pass.length() < 8)
                {
                    password.setError("You must have atleast 8 characters in your password");
                    password.setText("");
                    repassword.setText("");
                    return;
                }
                if(!pass.equals(confirm))
                {
                    repassword.setError("Password does not match");
                    password.setText("");
                    repassword.setText("");
                    return;
                }
                else if(pass.equals(user_name))
                {
                    password.setError("Password should not be same as username");
                    password.setText("");
                    repassword.setText("");
                    return;
                }
                else if(user_name.equals(fname))
                {
                    username.setError("Username should not be same as full name");
                    return;
                }
                else
                {
                    RegisterDetails user = new RegisterDetails(fname,user_name,pass,mail,pno,cardname,cardnum,c_cvv,date,Card,card_type);
                    Firebase ref = new Firebase("https://luminous-torch-5174.firebaseio.com/users/");
                    Map<String, RegisterDetails> newuser = new HashMap<String, RegisterDetails>();

                    Map<String,Object> newVal=new HashMap<>();

                    newVal.put("password",user.getPassword());
                    newVal.put("cvv",user.getCvv());
                    newVal.put("username",user.getUsername());
                    newVal.put("cardnumber",user.getCardnumber());
                    newVal.put("nameoncard",user.getNameoncard());
                    newVal.put("email",user.getEmail());
                    newVal.put("fullname",user.getFullname());
                    newVal.put("phoneno",user.getPhoneno());
                    newVal.put("expirydate",user.getDate());
                    newVal.put("Cardtype",user.getCard());
                    newVal.put("Card_name",user.getCard_type());
                    ref.child(""+user_name).updateChildren(newVal);
                    Intent intent = new Intent(Registration.this,LoginActivity.class);
                    startActivity(intent);
                }
            }
        });

        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Registration.this,LoginActivity.class);
                startActivity(intent);
                Registration.this.finish();
            }
        });
    }

    public static boolean isTablet(Context context)
    {
        return (context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK)
                >= Configuration.SCREENLAYOUT_SIZE_LARGE;
    }

    public void selectDate(View view) {
        DialogFragment newFragment = new SelectDateFragment();
        newFragment.show(getFragmentManager(),"DatePicker");
    }
    public void populateSetDate(int year, int month, int day) {
        mEdit = (TextView)findViewById(R.id.date_in);
        mEdit.setText(month+"/"+day+"/"+year);
        date = (String)mEdit.getText().toString();
    }
    public class SelectDateFragment extends DialogFragment implements DatePickerDialog.OnDateSetListener {
        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            final Calendar calendar = Calendar.getInstance();
            int yy = calendar.get(Calendar.YEAR);
            int mm = calendar.get(Calendar.MONTH);
            int dd = calendar.get(Calendar.DAY_OF_MONTH);
            return new DatePickerDialog(getActivity(), this, yy, mm, dd);
        }

        public void onDateSet(DatePicker view, int yy, int mm, int dd) {
            populateSetDate(yy, mm+1, dd);
        }
    }

    @Override
    public void onBackPressed() {
        Intent intent = new Intent(Registration.this,LoginActivity.class);
        startActivity(intent);
        Registration.this.finish();
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
