package com.example.roomcontacts;


import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "contacts_table")
public class Contacts {

    @ColumnInfo(name = "contancts_id")
    @PrimaryKey(autoGenerate = true)
    private int id;

    @ColumnInfo(name = "contacts_name")
    private String name;

    @ColumnInfo(name = "contacts_email")
    private String email;

    public Contacts(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Contacts() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
