package sql_connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
    // �������ݿ�����  com.mysql.jdbc.Driver
        private static String dbdriver = "com.mysql.jdbc.Driver";
        // ��ȡmysql���ӵ�ַ
        private static String dburl = "jdbc:mysql://localhost:3306/music_db?&useSSL=false&serverTimezone=GMT%2B8";
        // ��������
        private static String username = "root";
        // ���ݿ�����
        private static String userpassword = "lyp82nlf";
        // ��ȡһ�����ݵ�����
        public static Connection conn = null;
        // ��ȡ���ӵ�һ��״̬

      /*  public static void main(String[] args) throws SQLException {
            List<List<Object>> x = getData("user_cmx",
                    "select name,age from user");
            System.out.println("x=" + x);
        }*/

    /**
     * ��ȡ���ݿ�����
     * 
     * @param myProjName
     * @return
     */
    private static Connection getConn(String myProjName) {
        Connection conn = null;
        try {
            Class.forName(dbdriver);            
            String myjdbcUrl = dburl.replace("cmxDatabaseName", myProjName);
            conn = DriverManager.getConnection(myjdbcUrl, username, userpassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    /**
     * �ر����ݿ�����
     * 
     * @param rs
     * @param ps
     * @param conn
     */
    private static void closeAll(ResultSet rs, PreparedStatement ps,
            Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn == null)
            return;
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * ����������е��б���ÿ���б��а����е��б���
     * 
     * @param ProjName
     * @param sql
     * @return
     */
    public static List<List<Object>> getData(String ProjName, String sql) {
        Connection conn = getConn(ProjName);
        PreparedStatement ps = null;
        List<List<Object>> list = new ArrayList<List<Object>>();
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount();
            while (rs.next()) {
                List<Object> lst = new ArrayList<Object>();
                for (int i = 1; i <= columnCount; ++i) {
                    lst.add(rs.getObject(i) == null ? "" : rs.getObject(i));
                }
                list.add(lst);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(rs, ps, conn);
        }
        return list;
    }
}