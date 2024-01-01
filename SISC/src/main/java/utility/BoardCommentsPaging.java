package utility;

public class BoardCommentsPaging {
	//����¡ ���� ����	
	private int totalCount = 0 ; //�� ���ڵ� �Ǽ�
	private int totalPage = 0 ; //��ü ������ ��
	private int pageNumber = 0 ; //������ ������ �ѹ�
	private int pageSize = 0 ; //�� �������� ������ �Ǽ�
	private int beginRow = 0 ; //���� �������� ���� ��
	private int endRow = 0 ; //���� �������� �� ��
	private int pageCount = 3 ; // �� ȭ�鿡 ������ ������ ��ũ ��
	private int beginPage = 0 ; //����¡ ó�� ���� ������ ��ȣ
	private int endPage = 0 ; //����¡ ó�� �� ������ ��ȣ
	private int offset = 0 ; // �󸶳� �ǳʶ۰��̳�
	private int limit = 0 ; // �������������� �󸶳� ����Ұ��̳�
	private int b_num = 0 ; //�����ȣ
	private int ref = 0 ; //������ ��ȣ ������ �޸� ����� �ٸ� ���ۿ� �޸� ��۰� �����ϱ� ����
	private String board = "" ;	//���� �Խ������� �����ϱ� ����
	private String url = "" ; // ��� ���������� �� ��ü�� ����Ұ��̳�
	private String pagingHtml = "";//�ϴ��� ���� ������ ��ũ

	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginRow() {
		return beginRow;
	}


	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {
		this.offset = offset;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		
		return pagingHtml;

	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}


	public BoardCommentsPaging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url,
			int b_num,
			int ref,
			String board) {

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "10" ; 
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // �� �������� ������ ���ڵ� ����
		
		this.b_num = b_num;
		this.ref = ref;
		this.board = board;
		
		this.totalCount = totalCount ;

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
		// ��ü ���ڵ尡 ���� 17.0 ���� ���������� ������ ����� �����༭ �ø�����ŭ �������� �����
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		} // ������ �������� �ϳ��� �־��µ� ����������, �� �������� ���� �������� ���Խ�Ų��
		
		this.offset = ( pageNumber - 1 ) * pageSize ;
		// �ǳʶ� ������
		
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; //  /ex/list.ab
		
		//System.out.println("url2:"+url); //url2:/ex/list.ab
		this.pagingHtml = getPagingHtml(url) ;
		// ��ó�� ���� 1 2 3 ���� �� ��
		
	} // �������� ��
	
	private String getPagingHtml( String url ){ //����¡ ���ڿ��� �����.
		System.out.println("getPagingHtml url:"+url); 
		
		String result = "" ;
		
		if (this.beginPage != 1) {
			result += "&nbsp;<a href='" + url  
					+ "?b_num=" + this.b_num + "&ref=" + this.ref + "&pageNumber=" + ( 1 ) 
					+ "&board=" + this.board + "'>�� ó��</a>&nbsp;" ;
			result += "&nbsp;<a href='" + url 
					+ "?b_num=" + this.b_num + "&ref=" + this.ref + "&pageNumber=" + (this.beginPage - 1 ) 
					+ "&board=" + this.board + "'>����</a>&nbsp;" ;
		}
		
		//���
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			if ( i == this.pageNumber ) {
				result += "&nbsp;<font color='red'>" + i + "</font>&nbsp;"	;
						
			} else {
				result += "&nbsp;<a href='" + url   
						+ "?b_num=" + this.b_num + "&ref=" + this.ref 
						+ "&pageNumber=" + i + "&board=" + this.board
						+ "'>" + i + "</a>&nbsp;" ;
				
			}
		}
		
		System.out.println("result:"+result); 
		System.out.println();
		
		if ( this.endPage != this.totalPage) { 
			
			result += "&nbsp;<a href='" + url  
					+ "?b_num=" + this.b_num + "&ref=" + this.ref + "&pageNumber=" + (this.endPage + 1 ) 
					+ "&board=" + this.board + "'>����</a>&nbsp;" ;
			
			result += "&nbsp;<a href='" + url 
					+ "?b_num=" + this.b_num + "&ref=" + this.ref + "&pageNumber=" + (this.totalPage ) 
					+ "&board=" + this.board + "'>�� ��</a>&nbsp;" ;
		}		
		System.out.println("result2:"+result);
		
		return result ;
	}	
	
}

