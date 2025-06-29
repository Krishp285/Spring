package com.entity;

import lombok.Data;

@Data
public class ExpenseEntity
{
    private int id;
    private String title;
    private String category;
    private double amount;
    private String expensedate;
    private int userid;

   
}