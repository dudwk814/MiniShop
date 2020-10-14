package security;

import lombok.Setter;
import lombok.Value;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class UserTests {

    @Setter(onMethod_ = {@Autowired})
    private PasswordEncoder encoder;

    @Setter(onMethod_ = {@Autowired})
    private DataSource ds;

    @Test
    public void testInsertUser() {

        String sql = "insert into tbl_user (user_no, user_id, user_pw, user_pw2, user_name, address) values (?, ?, ?, ?, ?, ?)";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, 1);
            pstmt.setString(2, "admin");
            pstmt.setString(3, "admin");
            pstmt.setString(4, "admin");
            pstmt.setString(5, "admin");
            pstmt.setString(6, "seoul");

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception e) {

                }
            }

            if(con != null) {
                try {
                    con.close();
                } catch (Exception e) {

                }
            }
        }
    }
}
