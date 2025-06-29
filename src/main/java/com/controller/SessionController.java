package com.controller;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Dao.ExpenseDao;
import com.Dao.UserDao;
import com.cloudinary.Cloudinary;
import com.entity.ExpenseEntity;
import com.entity.UserEntity;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController
{
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	Cloudinary cloudinary;
	
	@Autowired
	MailerService mailerService;
	
	@Autowired
	ExpenseDao expenseDao;
	
	@GetMapping("/signup")
	public String signup()
	{
		return "Signup";
	}
	@GetMapping("/login")
	public String login()
	{
		return "Login";
	}
	@PostMapping("/saveuser")
	public String saveuser(@ModelAttribute UserEntity user ,@RequestParam("profilePic") MultipartFile profilePic) // MultipartFile profilePic 
	
	{
		System.out.println(user);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		
		try
		{
			String masterpath = "D:\\Spring\\expense_tracker\\src\\main\\webapp\\profilepics";
			File file = new File(masterpath,profilePic.getOriginalFilename());
			FileCopyUtils.copy(profilePic.getBytes(),file);
			 user.setProfilePicPath("profilepics/" + profilePic.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		try {
//			  Map uploadResult = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//			  System.out.println(uploadResult.get("secure_url").toString());
//			  user.setProfilePicPath(uploadResult.get("secure_url").toString());
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		userDao.addUser(user);
		
		try {
			mailerService.sendmail(user.getEmail() ,user.getFirstname());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	           
	   
		return "dashboard";
	}
	
	
	@PostMapping("/authenticateuser")
	public String authenticate(UserEntity user ,HttpSession session)
	{
		System.out.println(user);
		UserEntity userEntity = userDao.fingbymail(user.getEmail());
		if (userEntity != null && passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) 
		{
			session.setAttribute("user",userEntity);
			return "dashboard"; // Redirect to dashboard";
		} else {
			return "Login";
		}
	}
	
	
		
	
	// Show dashboard
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
	    if (session.getAttribute("user") == null) {
	        return "redirect:/login";
	    }
	    return "dashboard"; // dashboard.jsp
	}

	// Add Expense page
	@GetMapping("/addexpense")
	public String addExpense(HttpSession session) {
	    if (session.getAttribute("user") == null) {
	        return "redirect:/login";
	    }
	    return "addexpense"; // add_expense.jsp
	}

	// View Expenses / Reports page
	@GetMapping("/viewexpensesform")
	public String viewExpenses(HttpSession session) {
	    if (session.getAttribute("user") == null) {
	        return "redirect:/login";
	    }
	    return "viewexpenses"; // view_expenses.jsp
	}

	// Profile page
	@GetMapping("/profile")
	public String profile(HttpSession session) {
	    if (session.getAttribute("user") == null) {
	        return "redirect:/login";
	    }
	    return "profile"; // profile.jsp
	}

	
	@GetMapping("/addexpenseform")
	public String addExpenseForm(HttpSession session) {
	    if (session.getAttribute("user") == null) return "redirect:/login";
	    return "add_expense";
	}

	// Save Expense
	@PostMapping("/saveexpense")
	public String saveExpense(@ModelAttribute ExpenseEntity expense, HttpSession session) {
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    if (user == null) return "redirect:/login";

	    expense.setUserid(user.getUserid());
	    expenseDao.addExpense(expense);
	    return "redirect:/viewexpenses";
	}

	// View All Expenses for Logged-in User
	@GetMapping("/viewexpenses")
	public String viewExpenses(HttpSession session, Map<String, Object> model) {
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    if (user == null) return "redirect:/login";

	    model.put("expenses", expenseDao.getExpensesByUser(user.getUserid()));
	    return "viewexpenses";
	}
		
}
	

