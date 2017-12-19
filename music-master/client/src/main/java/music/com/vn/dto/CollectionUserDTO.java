package music.com.vn.dto;

import java.util.List;

public class CollectionUserDTO {
	public Pagination  page;
	public  List<UserDTO> listDTo;
	
	public Pagination getPage() {
		return page;
	}
	public void setPage(Pagination page) {
		this.page = page;
	}
	public List<UserDTO> getListDTo() {
		return listDTo;
	}
	public void setListDTo(List<UserDTO> listDTo) {
		this.listDTo = listDTo;
	}

}
