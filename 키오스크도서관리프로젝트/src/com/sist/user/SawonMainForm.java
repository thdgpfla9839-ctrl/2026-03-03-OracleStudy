package com.sist.user;
import java.util.*; 
import java.awt.*; 
import java.awt.event.*;
import javax.swing.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class SawonMainForm extends JFrame 
implements ActionListener // 로그인 버튼처리 때문에 추가해줌
{
   CardLayout card = new CardLayout();
   LoginForm login = new LoginForm();
   SawonControlForm scf = new SawonControlForm();
   public SawonMainForm()
   {
	   setLayout(card);
	   add("LOGIN",login); // 위에 있는게 먼저 실행된다(로그인창 먼저 띄우려면 위에 위치하게끔)
	   add("SCF",scf); 
	   
	   setSize(800, 600);
	   setVisible(true);
	   setDefaultCloseOperation(EXIT_ON_CLOSE);
	   
	   // 로그인 버튼
	   login.b1.addActionListener(this);
	   login.b2.addActionListener(this); // 버튼 처리하러 가자
	   
   }
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try
        {
        	UIManager.setLookAndFeel("com.jtattoo.plaf.mcwin.MCWINLookAndFeel");
        }catch(Exception ex) {}
        new SawonMainForm();
         new SawonMainForm();
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		// b2 버튼 처리 (b2이 쉬워서 먼저 만든대)
	}

}
