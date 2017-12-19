<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs"
      role="search">
    <div class="form-group">
        <div class="input-group">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-sm bg-white btn-icon rounded">
						<i class="fa fa-search"></i>
					</button>
				</span> <input type="text" id="search-song" class="form-control input-sm no-border rounded"
                               placeholder="Tìm kiếm bài hát ở đây...">
        </div>
        <div id="list-result-song">
            <section class="col-sm-12 no-padder bg">
                <section class="vbox">
                    <section class="scrollable hover">
                        <ul  id="item-song" class="list-group list-group-lg no-bg auto m-b-none m-t-n-xxs">

                        </ul>
                    </section>
                </section>
            </section>
        </div>
    </div>
</form>