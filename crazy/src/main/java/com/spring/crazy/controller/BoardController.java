package com.spring.crazy.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.crazy.model.BoardPager;
import com.spring.crazy.model.CrazyBoardVO;
import com.spring.crazy.service.CrazyBoardService;
import com.spring.crazy.utils.UploadFileUtils;

@Controller
public class BoardController {
	@Inject
	CrazyBoardService service;

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping(value = "/crazydelete.do")
	public String delete(@RequestParam int bno) throws Exception {
		service.crazydelete(bno);
		return "redirect:/crazyboard.do";
	}

	@RequestMapping(value = "/crazyboardview.do")
	public ModelAndView boardview(@RequestParam int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("crazyboardview");
		mav.addObject("bno", service.crazyboardread(bno));

		return mav;
	}

	@RequestMapping(value = "/crazyboard.do")
	public ModelAndView crazyboard(@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count = service.crazyboardarticle();
		BoardPager pager = new BoardPager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		ModelAndView mav = new ModelAndView();
		List<CrazyBoardVO> list = service.crazyList(start, end);
		mav.setViewName("crazyboard");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pager", pager);
		mav.addObject("map", map);

		return mav;
	}

	@RequestMapping(value = "/crazywrite.do")
	public String crazywrite() {
		return "crazywrite";

	}

	@RequestMapping(value = "/crazywriteaction.do", method = RequestMethod.POST)
	public String crazywriteaction(CrazyBoardVO vo, MultipartFile file, HttpSession session) throws Exception {

		if (vo.getSubject().equals("")) {
			
			return "redirect:/crazywrite.do";
		} else {

			// ?????? ??????
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);
				vo.setThumbimg(File.separator + "resources" + File.separator + "imgUpload" + ymdPath + File.separator
						+ fileName);
				System.out.println(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			} else {
				fileName = File.separator + "resources" + File.separator + "images" + File.separator + "none.png";
				System.out.println(fileName);
				vo.setThumbimg(fileName);
			}

			System.out.println(vo.getDescription());

			// ???? ??????
			String writer = (String) session.getAttribute("userid");
			vo.setWriter(writer);
			System.out.println(vo.getContent() + vo.getSubject());
			service.crazywrite(vo);
			return "redirect:/crazyboard.do";
		}
	}

	@RequestMapping(value = "/crazyboardupdate.do", method = RequestMethod.POST)
	public String crazyboardupdate(CrazyBoardVO vo, MultipartFile file, HttpSession session) throws Exception {

		if (vo.getSubject().equals("")) {
			int b = vo.getBno();
			String bn = Integer.toString(b);
			return "redirect:/crazyboardview.do?bno="+bn;
		} else {

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
						ymdPath);
				vo.setThumbimg(File.separator + "resources" + File.separator + "imgUpload" + ymdPath + File.separator
						+ fileName);
				System.out.println(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			} else {
				fileName = File.separator + "resources" + File.separator + "images" + File.separator + "none.png";
				System.out.println(fileName);
				vo.setThumbimg(fileName);
			}
			System.out.println(vo.getDescription());

			service.crazyboardupdate(vo);
			return "redirect:/crazyboard.do";
		}
	}

}
