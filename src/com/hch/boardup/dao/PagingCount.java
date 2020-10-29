package com.hch.boardup.dao;

public class PagingCount {
	int links = 10;
	int limit = 10;
	int totalpage = 0;
	
	public PagingCount() {
		super();
	}
	
	public PagingCount(int numrows) {
		super();
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public PagingCount(int numrows, int links, int limit) {
		super();
		this.links = links;
		this.limit = limit;
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public int countOffset(int page) {
		int offset = (page-1)*this.limit;
		return offset;
	}
	
	public String showPaging(int pagelink,String pagename) {
		String str = "";
		str="<TABLE width=\"550\" border=\"1\" align=\"center\">";
		str=str+"<tr><Td align=\"center\" bgcolor=\"#CCCCCC\">";
		
		int bpage = 0;
		int boffset = 0;
		
		int cpage = 0;
		int coffset = 0;
		
		int vpage = 0;
		int noffset = 0;
		
		int loffset = 0;
		
		if(pagelink != 1) {
			str=str+"[<a href="+pagename+"?pagelink=1&offset=0><font size=2 color=red>처음</font></a>]";
		}else {
			str=str+"[<font size=2 color=gray>처음</font>]";
		}
		
		bpage = pagelink - 10;
		boffset = countOffset(bpage);
		if(pagelink > links) {
			str=str+"[<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"><font size=2 color=blue>이전10</font></a>]";
		}else {
			str=str+"[<font size=2 color=gray>이전10</font>]";
		}
		
		vpage = pagelink;
		
		pagelink = ((pagelink-1)/links)*links+1;
		
		for(cpage=pagelink; cpage < pagelink+links; cpage++) {
			if(cpage>totalpage) {
				break;
			}
			coffset=countOffset(cpage);
			if(cpage!=vpage) {
				str=str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+"><font size=2 color=black>"+cpage+"</font></a>]";
			}else {
				str=str+"[<font size=2 color=red>"+cpage+"</font>]";
			}
		}
			noffset=countOffset(cpage);
			if(totalpage-pagelink >= links) {
				str=str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"><font size=2 color=blue>다음10</font></a>]";
			}else {
				str=str+"[<font size=2 color=gray>다음10</font>]";
			}
			
			loffset=countOffset(totalpage);
			
			if(vpage != totalpage) {
				str=str+"[<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"><font size=2 color=red>마지막</font></a>]";
			}else {
				str=str+"[<font size=2 color=gray>마지막</font>]";
			}
			str=str+"</td></tr></table>";
			return str;
	}
	
	public String showPaging(int pagelink, String pagename, String find, String search) {
		String str = "";
		str="<TABLE width=\"550\" border=\"1\" align=\"center\">";
		str=str+"<tr><Td align=\"center\" bgcolor=\"#CCCCCC\">";
		
		int bpage = 0;
		int boffset = 0;
		
		int cpage = 0;
		int coffset = 0;
		
		int vpage = 0;
		int noffset = 0;
		
		int loffset = 0;
		
		if(pagelink != 1) {
			str=str+"[<a href="+pagename+"?pagelink=1&offset=0&find="+find+"&search="+search+"><font size=2 color=red>처음</font></a>]";
		}else {
			str=str+"[<font size=2 color=gray>처음</font>]";
		}
		
		bpage = pagelink - 10;
		boffset = countOffset(bpage);
		if(pagelink > links) {
			str=str+"[<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"&find="+find+"&search="+search+"><font size=2 color=blue>이전10</font></a>]";
		}else {
			str=str+"[<font size=2 color=gray>이전10</font>]";
		}
		
		vpage = pagelink;
		
		pagelink = ((pagelink-1)/links)*links+1;
		
		for(cpage=pagelink; cpage < pagelink+links; cpage++) {
			if(cpage>totalpage) {
				break;
			}
			coffset=countOffset(cpage);
			if(cpage!=vpage) {
				str=str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+"&find="+find+"&search="+search+"><font size=2 color=black>"+cpage+"</font></a>]";
			}else {
				str=str+"[<font size=2 color=red>"+cpage+"</font>]";
			}
		}
			noffset=countOffset(cpage);
			if(totalpage-pagelink >= links) {
				str=str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"&find="+find+"&search="+search+"><font size=2 color=blue>다음10</font></a>]";
			}else {
				str=str+"[<font size=2 color=gray>다음10</font>]";
			}
			
			loffset=countOffset(totalpage);
			
			if(vpage != totalpage) {
				str=str+"[<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"&find="+find+"&search="+search+"><font size=2 color=red>마지막</font></a>]";
			}else {
				str=str+"[<font size=2 color=gray>마지막</font>]";
			}
			str=str+"</td></tr></table>";
			return str;
	}
}
