<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import ="java.sql.*"%>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<% 
final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
final String DB_URL ="jdbc:mysql://localhost:8080/BoardGameProject_Test/HomePage.jsp";
final String USER ="root";
final String PASS ="MCU04132462Wu";
Connection conn = null;
Statement stmt= null; 

try {			
    //��l���X��
	Class.forName("com.mysql.jdbc.Driver");
	//���}�s��			
	System.out.println("Connecting to database..");						
	conn = DriverManager.getConnection(DB_URL,USER,PASS);
	//����ШD
	System.out.println("Creating statement...");
	stmt = conn.createStatement();
	String sql;
	sql = "SELECT UserID , UserName , UserGender FROM userdata";
	ResultSet rs = stmt.executeQuery(sql);
	
	//������ƨ��x�s�Ѽ�;
	while(rs.next()) {
		//�i�[��L�x�s �ݧڦۤv��ԣ
		int UserID = rs.getInt("UserID");				
		String UserName = rs.getString("UserName");
		//��ܼƭ�
		System.out.println("ID: "+ UserID);
		System.out.println("First: "+ UserName);				
	}
	//�M�z��������
	rs.close();
	stmt.close();
	conn.close();

} catch(SQLException se) {
    System.out.println("�o��SQL���~");
} catch(Exception e) {
	System.out.println("�o�Ϳ��~");
	e.printStackTrace();
} finally {
	//���ץ��������귽(���ӥ�)
	try{
        if(stmt!=null)
           stmt.close();
     }catch(SQLException se2){
     }// nothing we can do
     try{
        if(conn!=null)
           conn.close();
     }catch(SQLException se){
        se.printStackTrace();
     }//end finally try
}
System.out.println("Goodbye!");     
%>
</body>
</html>