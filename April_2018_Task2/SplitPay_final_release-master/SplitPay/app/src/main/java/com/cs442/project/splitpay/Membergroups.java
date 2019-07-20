package com.cs442.project.splitpay;

public class Membergroups {
    private String membername;
    private String groupname;
    public Membergroups(String membername,String groupname)
    {
        this.membername=membername;
        this.groupname=groupname;
    }
    public String getMembername(){
        return membername;
    }
    public String getGroupname(){
        return groupname;
    }
}
//To store membername and membergroup details