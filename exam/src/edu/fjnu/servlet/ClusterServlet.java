package edu.fjnu.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;
import edu.fjnu.domain.Cluster;
import edu.fjnu.service.ClusterService;

/**
 * 聚类分析
 * @author zhangzhiyong
 *
 */
@WebServlet("/ClusterServlet")
public class ClusterServlet extends BaseServlet {

	private ClusterService clusterService = new ClusterService(); 
	
	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String subject = request.getParameter("subject");
		
		List<Cluster> goodList = clusterService.getAllKeywordsByLevel(subject,"good");
		List<Cluster> badList = clusterService.getAllKeywordsByLevel(subject,"bad");
		List<Cluster> middle_goodList = clusterService.getAllKeywordsByLevel(subject,"middle_good");
		List<Cluster> middle_badList = clusterService.getAllKeywordsByLevel(subject,"middle_bad");
		
		request.setAttribute("goodList", goodList);
		request.setAttribute("badList", badList);
		request.setAttribute("middle_goodList", middle_goodList);
		request.setAttribute("middle_badList", middle_badList);
		
		return "f:/index/jsp/cluster.jsp";
	}
}