package edu.fjnu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.servlet.BaseServlet;
import edu.fjnu.domain.Student;
import edu.fjnu.domain.Teacher;
import edu.fjnu.service.StudentInfoService;
import edu.fjnu.service.TeacherInfoService;

/**
 * 验证登录信息
 * @author vengeance
 *
 */
@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 判断登录的是老师还是学生
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String permission = request.getParameter("user");
		HttpSession session = request.getSession();
		String userID = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(permission.equals("student")){//如果是学生
			Student student = new Student();
			StudentInfoService stuService = new StudentInfoService();
			
			student.setStudentID(userID);
			student.setSpassword(password);
			
			if(stuService.checkInfo(student)){//验证学生登录信息是否正确，如果正确，将登录信息保存在session中
				session.setAttribute("userID", student.getStudentID());
				request.getRequestDispatcher("/StudentInfoServlet?method=stuInfo")
				.forward(request, response);//调用处理学生信息的servlet显示学生主页面
			}else{//如果登录失败
				request.getRequestDispatcher("/error.jsp").forward(request, response);;
			}
		}else if(permission.equals("teacher")){//如果是老师
			Teacher teacher = new Teacher();
			TeacherInfoService teaService = new TeacherInfoService();
			
			teacher.setTeacherID(userID);
			teacher.setTpassword(password);
			
			if(teaService.checkInfo(teacher)){//验证老师登录信息是否正确，如果正确，将登录信息保存在session中
				session.setAttribute("userID", userID);
			
				request.getRequestDispatcher("/TeacherInfoServlet?method=teaLoadInfo")
				.forward(request, response);//调用处理老师信息的servlet显示老师主页面
			}else{//如果登录失败
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}
	}
}
