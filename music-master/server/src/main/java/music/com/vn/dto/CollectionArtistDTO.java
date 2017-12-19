package music.com.vn.dto;

import java.util.List;

public class CollectionArtistDTO {
	public Pagination  page;
	public  List<ArtistDTO> listDTo;
	
	public Pagination getPage() {
		return page;
	}
	public void setPage(Pagination page) {
		this.page = page;
	}
	public List<ArtistDTO> getListDTo() {
		return listDTo;
	}
	public void setListDTo(List<ArtistDTO> listDTo) {
		this.listDTo = listDTo;
	}
}
