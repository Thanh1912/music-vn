package music.com.vn.dto;

import java.util.List;

public class CollectionSongDTO {
	public Pagination  page;
	public  List<SongDTO> listDTo;
	
	public Pagination getPage() {
		return page;
	}
	public void setPage(Pagination page) {
		this.page = page;
	}
	public List<SongDTO> getListDTo() {
		return listDTo;
	}
	public void setListDTo(List<SongDTO> listDTo) {
		this.listDTo = listDTo;
	}
}
