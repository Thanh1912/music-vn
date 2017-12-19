package music.com.vn.service;

import music.com.vn.dto.CollectionSongDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.SongDTO;

import java.util.List;

public interface SongService {
	public SongDTO save(SongDTO Song);

	public SongDTO update(SongDTO Song);

	public boolean delete(Long id);

	public SongDTO findOne(Long id);

	public CollectionSongDTO findAllSong(Pagination page) ;
	
	public CollectionSongDTO findAllSongByName(Pagination page,String name) ;

	public CollectionSongDTO findAllSongByAlbum(Pagination page, Long id) ;

	public CollectionSongDTO findAllSongByKindOfMusic(Pagination page, Long id) ;

	public List<SongDTO> topNewSong( );

	public List<SongDTO> findByIdUser(Long id);
}
