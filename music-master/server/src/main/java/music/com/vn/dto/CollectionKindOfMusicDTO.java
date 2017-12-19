package music.com.vn.dto;

import java.util.List;

public class CollectionKindOfMusicDTO {
    public Pagination  page;
    public List<KindOfMusicDTO> listDTo;
    public Pagination getPage() {
        return page;
    }
    public void setPage(Pagination page) {
        this.page = page;
    }
    public List<KindOfMusicDTO> getListDTo() {
        return listDTo;
    }
    public void setListDTo(List<KindOfMusicDTO> listDTo) {
        this.listDTo = listDTo;
    }
}
