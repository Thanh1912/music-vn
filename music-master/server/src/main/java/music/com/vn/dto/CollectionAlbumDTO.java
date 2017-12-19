package music.com.vn.dto;

import java.util.List;

public class CollectionAlbumDTO {
	public Pagination  page;
	public  List<AlbumDTO> listDTo;
	
	public Pagination getPage() {
		return page;
	}
	public void setPage(Pagination page) {
		this.page = page;
	}
	public List<AlbumDTO> getListDTo() {
		return listDTo;
	}
	public void setListDTo(List<AlbumDTO> listDTo) {
		this.listDTo = listDTo;
	}
}
