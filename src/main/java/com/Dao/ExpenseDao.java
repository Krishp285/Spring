package com.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.ExpenseEntity;

@Repository
public class ExpenseDao {

    @Autowired
    private JdbcTemplate stmt;

    public void addExpense(ExpenseEntity expense) {
        stmt.update("INSERT INTO expenses (title, category, amount, date , userid) VALUES (?, ?, ?, ?, ?)",
                expense.getTitle(), expense.getCategory(), expense.getAmount(), expense.getDate(), expense.getUserid());
    }

    public List<ExpenseEntity> getExpensesByUser(int userId) {
        return stmt.query("SELECT * FROM expenses WHERE userid = ?",
                new BeanPropertyRowMapper<>(ExpenseEntity.class), userId);
    }
}
