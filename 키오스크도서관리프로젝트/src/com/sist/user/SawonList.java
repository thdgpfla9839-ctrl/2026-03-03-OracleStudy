package com.sist.user;
// 사원목록출력
import java.awt.*;
import java.awt.event.*;
import java.util.List;

import javax.swing.*;
import javax.swing.table.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class SawonList extends JPanel 
implements ActionListener
{
   JTable table;
   DefaultTableModel model;
   JButton b1,b2,b3;
   JLabel la = new JLabel("0 page / 0 pages");
   JButton b4,b5;
   
   // 여기에 멤버변수 잡았다 , 초기화가 되면 안 되는 것들은 멤버변수로 잡고 들어가야한다
   int curpage = 1;
   int totalpage = 0;
   EmpDAO dao =new EmpDAO(); // new가 안되기 때문에 하나만 사용이됨
   // 싱긅턴을 안 잡아서 멤버변수로 잡아서 사용하고 있어
   
   public SawonList()
   {
	   b1 = new JButton("사원 추가");
	   b2 = new JButton("사원 수정");
	   b3 = new JButton("사원 삭제");
	   
	   // 목록 출력
	   String [] col = {"사번","이름","직위","입사일","부서명","근무지"}; // 관리자가 보니까 사원이 먼저 올라오게
	   String [][] row = new String[0][6]; // 앞에[]가 row 뒤에 []가 col에 해당된다
	   model = new DefaultTableModel(row,col)
	   {

		@Override
		public boolean isCellEditable(int row, int column) {
			// TODO Auto-generated method stub
			return column ==2 || column ==4 || column ==5; 
			// 이렇게 부서관리도 바꿔주면 도ㅐ
		}
		   
		
		  
		   
	   };
	   table = new JTable(model);
	   JScrollPane js = new JScrollPane(table);
	   setLayout(new BorderLayout());
	   JPanel p = new JPanel();
	   p.add(b1); p.add(b2);p.add(b3);
	   add("North",p);
	   add("Center",js);
	   
	   b4 = new JButton("이전 버튼");
	   b5 = new JButton("다음 버튼");
	   
	   JPanel pp =new JPanel();
	   pp.add(b4);pp.add(la);pp.add(b5); // 출력순서 먼저쓰는게 먼저 출력됨
	   add("South",pp);
	   print(); // 여기에 프린트 추가하면 돼
	   
	   // 위에 액션리스너 추가하고 등록해줘야해
	   b4.addActionListener(this);
	   b5.addActionListener(this);
	   
   }
   // 현재 페이지와 총페이지가 계속 변경이 되면서 메모리에 유지가 돼야해 -> 멤버를 잡아줘야함
   public void print()
   {
	   for(int i = model.getRowCount()-1;i>=0;i--)
	   {
		   model.removeRow(i);
	   }
	   List<EmpVO> list=dao.empListData(curpage);
	   totalpage=dao.empTotalPage();
	   
	   // 목록
	   for(EmpVO vo:list)
	   {
		   String[] data={
			  String.valueOf(vo.getEmpno()), // 오류가 나니까 문자열로 변경해준다

			  vo.getEname(),
			  vo.getJob(),
			  vo.getDbday(),
			  vo.getDvo().getDname(),
			  vo.getDvo().getLoc()
		   };
		   model.addRow(data); // 이제 위에 프린트 추가하러 올라가
	   }
	   // 페이지
	   la.setText(curpage+" page / "+totalpage+" pages");
	   
   }
   @Override
   public void actionPerformed(ActionEvent e) {
	// TODO Auto-generated method stub
	if(e.getSource() == b4)
	{
		if(curpage>1)
		{
			curpage--;
			print();
		}
	}
	else if(e.getSource() == b5)
	{
		if(curpage<totalpage)
		{
			curpage++;
			print();
		}
	}
   }
}
