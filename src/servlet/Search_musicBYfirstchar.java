package servlet;

import java.sql.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sql_connect.DatabaseUtil;
import tool_class.Json;
import org.json.*;

/**
 * Servlet implementation class Search_firstchar
 */
@WebServlet("/Search_firstchar")
public class Search_musicBYfirstchar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_musicBYfirstchar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ResultSet res=null;
		String resCode = "";
		String resMsg = "";
		String firstchar=request.getParameter("music_firstcharacter");
		String querysql="select * from search_musicbyfirstchar where music_firstchar= '"+firstchar+"';";
		String test_sql="select * from search_musicbyfirstchar";
		JSONArray array = new JSONArray();
		System.out.println(firstchar);
		try {
			res = DatabaseUtil.query (test_sql);
			} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			}
			finally{
				if(res==null) {
					resMsg="Can not search anything about "+firstchar;
				}
				else {
					try {
						array=Json.ResultsetToJsonArray(res);
					} catch (Exception e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
			}
        response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8"); // 设置响应报文的编码格式
		PrintWriter out = response.getWriter(); // 获取 response 的输出流
	 // 通过输出流把业务逻辑的结果输出	
		try {
		    out = response.getWriter();
		    out.write(array.toString());
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    if (out != null) {
		    	out.flush(); 
		        out.close();
		    }
		}

		
		
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
	}
	private void OutputStream_json(HttpServletResponse resp) throws IOException{
        String data = "输出的内容";
        //获取OutputStream输出流
        OutputStream outputStream = resp.getOutputStream();
        //将字符转换成字节数组，指定以UTF-8编码进行转换
        byte[] dataByteArr = data.getBytes("UTF-8");
        //使用OutputStream流向客户端输出字节数组
        outputStream.write(dataByteArr);
    }
	public void writeData(String data,HttpServletResponse response) {
		
	try {
		response.getWriter().write(data.toString());
	}catch(IOException e) {
	e.printStackTrace();
	}
	}
	
	
	}
	

	
	
