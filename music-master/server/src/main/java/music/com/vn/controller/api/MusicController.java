package music.com.vn.controller.api;

import music.com.vn.dto.CollectionSongDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.SongDTO;
import music.com.vn.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class MusicController {

	@Autowired
	SongService Songservice;

	@PostMapping("/apitest/music")
	public ResponseEntity<SongDTO> create(@RequestBody SongDTO Song) {
		SongDTO Songdto = Songservice.save(Song);
		return ResponseEntity.ok(Songdto);
	}

	@PutMapping(value = "/apitest/music/{id}")
	public ResponseEntity<SongDTO> update(@PathVariable Long id,@RequestBody SongDTO Songdto) {
		Songdto.setId(id);
		Songdto = Songservice.update(Songdto);
		if (null == Songdto) {
			throw new BadCredentialsException("Not found id Update");
		}
		return ResponseEntity.ok(Songdto);
	}
	@GetMapping("/apitest/music/{id}")
	public ResponseEntity<SongDTO> getOne(@PathVariable("id") Long id) {
		SongDTO Songdto = Songservice.findOne(id);
		if (Songdto == null) {
			return new ResponseEntity<SongDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}
	@GetMapping("/apitest/music-count/{id}")
	public ResponseEntity<SongDTO> getcountSong(@PathVariable("id") Long id) {
		SongDTO Songdto = Songservice.findOne(id);
		if (Songdto == null) {
			return new ResponseEntity<SongDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}
	@DeleteMapping("/apitest/music/{id}")
	public ResponseEntity<Long> delete(@PathVariable Long id) {
		if (Songservice.delete(id) == false) {
			return new ResponseEntity<Long>( HttpStatus.NO_CONTENT);
		}
		return ResponseEntity.ok(id);
	}
	@GetMapping("/apitest/music/")
	public ResponseEntity<CollectionSongDTO> searchbyname(@RequestParam(name = "size", defaultValue = "10") int recordPerPage,
			@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page = new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionSongDTO Songdto =Songservice.findAllSong(page);
		if (Songdto == null) {
			return new ResponseEntity<CollectionSongDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}

	@GetMapping("/apitest/music-top")
	public ResponseEntity<List<SongDTO>> gettop() {
		List<SongDTO> Songdto =Songservice.topNewSong();
		if (Songdto == null) {
			return new ResponseEntity<List<SongDTO>>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}
	@GetMapping("/apitest/music-by-user/{id}")
	public ResponseEntity<List<SongDTO>> findByIdUser(@PathVariable Long id) {
		List<SongDTO> Songdto =Songservice.findByIdUser(id);
		if (Songdto == null) {
			return new ResponseEntity<List<SongDTO>>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}

	
	@GetMapping("/apitest/music/search/byname")
	public ResponseEntity<CollectionSongDTO> searchbyname(@RequestParam(name = "size", defaultValue = "10") int recordPerPage,
			@RequestParam(name = "page", defaultValue = "0") int pageIndex,@RequestParam(name = "song", defaultValue = "") String nameSong) {
		Pagination page = new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionSongDTO Songdto =Songservice.findAllSongByName(page, nameSong);
		if (Songdto == null) {
			return new ResponseEntity<CollectionSongDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}
	
	@GetMapping("/apitest/music/search/byalbum/{idalbum}")
	public ResponseEntity<CollectionSongDTO> searchbyalbum(@PathVariable Long idalbum,@RequestParam(name = "size", defaultValue = "10") int recordPerPage,
			@RequestParam(name = "page", defaultValue = "0") int pageIndex  ) {
		Pagination page = new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionSongDTO Songdto =Songservice.findAllSongByAlbum(page, idalbum);
		if (Songdto == null) {
			return new ResponseEntity<CollectionSongDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}

	@GetMapping("/apitest/music/search/by-kind-of-music/{idKind}")
	public ResponseEntity<CollectionSongDTO> searchbyKind(@PathVariable Long idKind,@RequestParam(name = "size", defaultValue = "10") int recordPerPage, @RequestParam(name = "page", defaultValue = "0") int pageIndex  ) {
		Pagination page = new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionSongDTO Songdto =Songservice.findAllSongByKindOfMusic(page, idKind);
		if (Songdto == null) {
			return new ResponseEntity<CollectionSongDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Songdto);
	}

}
