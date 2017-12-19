package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.ArtistEntity;

import java.util.List;

public interface ArtistDao extends IOperations<ArtistEntity> {
	public List<ArtistEntity> findAll(Pagination page);
	public int count();
	public ArtistEntity loadId(Long id);
}
