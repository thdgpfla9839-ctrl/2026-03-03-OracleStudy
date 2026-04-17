package com.sist.board;

import java.util.*;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class BoardMain extends JFrame 
//implements ActionListener
{
	private CardLayout card = new CardLayout();
	BoardList blList = new BoardList();

	public BoardMain() {
		
		setLayout(card);
		add("blList",blList);
		setSize(640, 550);
		blList.print();
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE); // 이거 안 주면 누적이 된다 실행창 버튼 계속 눌러서 정지시켜야함
//		blList.prevBtn.addActionListener(this); // 이전 버튼
//		blList.nextBtn.addActionListener(this); // 다음 버튼
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new BoardMain();
	}

//	@Override
//	public void actionPerformed(ActionEvent e) {
//		// TODO Auto-generated method stub
//		
//	}

}
