package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class EditorController {
	private final String command = "editor.bd";
	private final String viewPage = "SmartEditor";
	private final String gotoPage = "redirect:SmartEditorList.bd";

	@Autowired
	private BoardDao edao;
	
	@Autowired
	ServletContext servletcontext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String editor() {
		
		return viewPage;
	}

	@RequestMapping(value = "editor2.pd")
	public String editorInsert(@RequestParam("txt") String txt) {
		
		edao.insertBoard(txt); 
		return gotoPage;
	}
	@RequestMapping(value="ImageUpload.pd")
	public void smarteditorMultiImageUpload(HttpServletRequest request, HttpServletResponse response){
		try {
			//��������
			String sFileInfo = "";
			//���ϸ��� �޴´� - �Ϲ� �������ϸ�
			String sFilename = request.getHeader("file-name");
			//���� Ȯ����
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//Ȯ���ڸ��ҹ��ڷ� ����
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//�̹��� ���� �迭����
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//Ȯ���� üũ
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//�̹����� �ƴ϶��
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//���丮 ���� �� ���ε�	
				
				//���ϰ��
				String filePath = servletcontext.getRealPath("/resources/uploadFolder");
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// ������ ���Ͼ��� ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// �̹��� /////////////////
				// ���� ���
				sFileInfo += "&bNewLine=true";
				// img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL="+filePath+sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
