package com.sist.user;
import javax.swing.*;
public class LoginForm extends JPanel{

	// 컨드롤패널 없이 탭으로 만들 예정

	 JLabel la1,la2;
	 JTextField tf1,tf2;
	 JButton b1,b2;
	 public LoginForm()
	 {
		 la1 = new JLabel("사번");
		 la2 = new JLabel("이름");
		 tf1 = new JTextField();
		 tf2 = new JTextField();
		 b1 = new JButton("로그인");
		 b2 = new JButton("취소");
		 
		 
		 setLayout(null);
		 la1.setBounds(300, 200, 40, 30);
		 tf1.setBounds(345, 200, 150, 30);
		 
		 la2.setBounds(300, 235, 40, 30);
		 tf2.setBounds(345, 2235, 150, 30);
		 
		 
		 JPanel p = new JPanel();
		 p.add(b1); p.add(b2);  // 이제 사원메인에서 로그인 폼채우기
		 p.setBounds(300, 270, 195, 35);
		 
		 add(la1);add(tf1);
		 add(la2);add(tf2);
		 
		 
	 }
}
