package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.SongEntity;

import java.util.List;

public interface SongDao extends IOperations<SongEntity>{
	public List<SongEntity> findAll(Pagination page);
	public List<SongEntity> findAllByname(Pagination page,String name);
	public int count();
    public List<SongEntity> findAllSongByAlbum(Pagination page, Long id) ;
	public List<SongEntity> findAllSongByKindOfMusic(Pagination page, Long id) ;
	public int countByAlbum(Long id);
	public int countByname(String nameSong);
	public int countByKinOfMusic(Long id);
	public List<SongEntity> topNewSong( );
	public SongEntity loadIdUser(Long id);

	public List<SongEntity> findByIdUser(Long id);

}
