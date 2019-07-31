package servlet;

import java.sql.*;
import java.util.HashMap;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sql_connect.DBUtil1;;
/**
 * Servlet implementation class Registion
 */
@WebServlet("/Registion")
public class Registion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	    String username = request.getParameter("username");
	    String password=request.getParameter("password");
	    String email_address=request.getParameter("email_address");
	    String resCode = "";
		String resMsg = "";
		String userId = "";
		try {
			Connection connect = DBUtil1.getConnect();
			Statement statement = (Statement) connect.createStatement(); // Statement�������Ϊ���ݿ����ʵ���������ݿ�����в�����ͨ������ʵ��
			ResultSet result;
			
			String sqlQuery = "select * from " + DBUtil1.TABLE_USERS + " where username='" + username + "';";
			
			// ��ѯ���������һ��ResultSet���ϣ�û�в鵽���ʱResultSet�ĳ���Ϊ0
			result = statement.executeQuery(sqlQuery); // �Ȳ�ѯͬ�����˺ţ������ֻ��ţ��Ƿ����
			if(result.next()){ // �Ѵ���
				resCode = "201";
				resMsg = "���˺���ע�ᣬ��ʹ�ô��˺�ֱ�ӵ�¼��ʹ�������˺�ע��";
				userId = "";
			} else { // ������
				String sqlInsertPass = "insert into " + DBUtil1.TABLE_USERS + "(username,password,email_address) values('"+username+"','"+password+"','"+email_address+"');";
				// �������������һ��int���͵�ֵ������ò���Ӱ�쵽������
				int row1 = statement.executeUpdate(sqlInsertPass); // �����ʺ�����
				if(row1 == 1){
					String sqlQueryId = "select userID from " + DBUtil1.TABLE_USERS + " where username='" + username + "';";
					ResultSet result2 = statement.executeQuery(sqlQueryId); // ��ѯ������¼��userId
					if(result2.next()){
						userId = result2.getInt("userID") + "";
					}
					resCode = "100";
					resMsg = "ע��ɹ�";
					/*String sqlInsertInfo = "insert into " + DBUtil.TABLE_USERINFO + "(userId) values('" + userId + "')";
					int row2 = statement.executeUpdate(sqlInsertInfo); // ���û���Ϣ���в����ע���Id
					if(row2 == 1){ // �������ж�����ɹ�����ҵ��Ƕ��϶�Ϊע��ɹ�
						resCode = "100";
						resMsg = "ע��ɹ�";
					}*/
				} else {
					resCode = "202";
					resMsg = "�û���Ϣ��������";
					userId = "";
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("resCode", resCode);
		map.put("resMsg", resMsg);
		map.put("userId", userId);
		
		response.setContentType("text/html;charset=utf-8"); // ������Ӧ���ĵı����ʽ
		PrintWriter pw = response.getWriter(); // ��ȡ response �������
		pw.println(map.toString()); // ͨ���������ҵ���߼��Ľ�����
		pw.flush();
	}
 
	    
	    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
