<%@page import="java.time.LocalDateTime"%>
<%@page import="model.Review"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@page import=" java.time.format.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%
	Map<String, Review> mapListReviews = ReviewDAO.mapReview;
	
	String x = request.getParameter("id");

	Map<String, Review> mapListReview = ReviewDAO.layDuLieuDanhGiaCuaSach(x);
	ArrayList<String> arrayStar = ReviewDAO.getListReivews(x);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="css/rating.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div class="reviews">
		<div class="reviews__average-ratings">
			<div class="average-ratings__stars">
				<div class="stars__single">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 45"
						width="43" height="45">
              <defs>
                <image width="32" height="30" id="img1"
							href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAeCAMAAAB61OwbAAAAAXNSR0IB2cksfwAAAGxQTFRF9vj/9uGb9vX09fPn989R9eSl9eSm9tJb99Rl9fHc9eex9fTo9evH9Om89dyF9tFa9dp79eax9fHd9tdw9vXz9tdv9eq89e7S9fDd9d6P9e7R9d+Q9vj+989S9tJa9em89fPo9eew9tp699Vm8/jTiwAAACR0Uk5TAP8Z//////////////////////8y/////////wD/////////WF554gAAAMlJREFUeJyFktkWgjAMBVMIWNlaARdUxOX//9HSIocGGvME5w5TLgTAHxEBOzEmPJDijlXEEnlFisgqRgGrGAWcwgkYhRMYRSDfTwLEjBySF6WopMLFKC0ORe28jZf4I3UO7TGcI56MgiHU2R4SJNRleskAMecAUcXnZro/+ZqQJIcrAW70O5cEaCggCEB/2F0ToM8J8KAtCh9o53a/i2yzhBzg2W3WeNmnE7so8Xu8+axKTLH1md3qSYlFbD+L7GuPSFarXrpdgC+z9gvgcfNgTwAAAABJRU5ErkJggg==" />
              </defs>
              <use id="Background" href="#img1" x="6" y="7" />
            </svg>
				</div>
				<div class="stars__single">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 45"
						width="43" height="45">
              <defs>
                <image width="32" height="30" id="img1"
							href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAeCAMAAAB61OwbAAAAAXNSR0IB2cksfwAAAGxQTFRF9vj/9uGb9vX09fPn989R9eSl9eSm9tJb99Rl9fHc9eex9fTo9evH9Om89dyF9tFa9dp79eax9fHd9tdw9vXz9tdv9eq89e7S9fDd9d6P9e7R9d+Q9vj+989S9tJa9em89fPo9eew9tp699Vm8/jTiwAAACR0Uk5TAP8Z//////////////////////8y/////////wD/////////WF554gAAAMlJREFUeJyFktkWgjAMBVMIWNlaARdUxOX//9HSIocGGvME5w5TLgTAHxEBOzEmPJDijlXEEnlFisgqRgGrGAWcwgkYhRMYRSDfTwLEjBySF6WopMLFKC0ORe28jZf4I3UO7TGcI56MgiHU2R4SJNRleskAMecAUcXnZro/+ZqQJIcrAW70O5cEaCggCEB/2F0ToM8J8KAtCh9o53a/i2yzhBzg2W3WeNmnE7so8Xu8+axKTLH1md3qSYlFbD+L7GuPSFarXrpdgC+z9gvgcfNgTwAAAABJRU5ErkJggg==" />
              </defs>
              <use id="Background" href="#img1" x="6" y="7" />
            </svg>
				</div>
				<div class="stars__single">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 45"
						width="43" height="45">
              <defs>
                <image width="32" height="30" id="img1"
							href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAeCAMAAAB61OwbAAAAAXNSR0IB2cksfwAAAGxQTFRF9vj/9uGb9vX09fPn989R9eSl9eSm9tJb99Rl9fHc9eex9fTo9evH9Om89dyF9tFa9dp79eax9fHd9tdw9vXz9tdv9eq89e7S9fDd9d6P9e7R9d+Q9vj+989S9tJa9em89fPo9eew9tp699Vm8/jTiwAAACR0Uk5TAP8Z//////////////////////8y/////////wD/////////WF554gAAAMlJREFUeJyFktkWgjAMBVMIWNlaARdUxOX//9HSIocGGvME5w5TLgTAHxEBOzEmPJDijlXEEnlFisgqRgGrGAWcwgkYhRMYRSDfTwLEjBySF6WopMLFKC0ORe28jZf4I3UO7TGcI56MgiHU2R4SJNRleskAMecAUcXnZro/+ZqQJIcrAW70O5cEaCggCEB/2F0ToM8J8KAtCh9o53a/i2yzhBzg2W3WeNmnE7so8Xu8+axKTLH1md3qSYlFbD+L7GuPSFarXrpdgC+z9gvgcfNgTwAAAABJRU5ErkJggg==" />
              </defs>
              <use id="Background" href="#img1" x="6" y="7" />
            </svg>
				</div>
				<div class="stars__single">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 45"
						width="43" height="45">
              <defs>
                <image width="32" height="30" id="img1"
							href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAeCAMAAAB61OwbAAAAAXNSR0IB2cksfwAAAGxQTFRF9vj/9uGb9vX09fPn989R9eSl9eSm9tJb99Rl9fHc9eex9fTo9evH9Om89dyF9tFa9dp79eax9fHd9tdw9vXz9tdv9eq89e7S9fDd9d6P9e7R9d+Q9vj+989S9tJa9em89fPo9eew9tp699Vm8/jTiwAAACR0Uk5TAP8Z//////////////////////8y/////////wD/////////WF554gAAAMlJREFUeJyFktkWgjAMBVMIWNlaARdUxOX//9HSIocGGvME5w5TLgTAHxEBOzEmPJDijlXEEnlFisgqRgGrGAWcwgkYhRMYRSDfTwLEjBySF6WopMLFKC0ORe28jZf4I3UO7TGcI56MgiHU2R4SJNRleskAMecAUcXnZro/+ZqQJIcrAW70O5cEaCggCEB/2F0ToM8J8KAtCh9o53a/i2yzhBzg2W3WeNmnE7so8Xu8+axKTLH1md3qSYlFbD+L7GuPSFarXrpdgC+z9gvgcfNgTwAAAABJRU5ErkJggg==" />
              </defs>
              <use id="Background" href="#img1" x="6" y="7" />
            </svg>
				</div>
				<div class="stars__single">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 45"
						width="43" height="45">
              <defs>
                <image width="32" height="30" id="img1"
							href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAeCAMAAAB61OwbAAAAAXNSR0IB2cksfwAAAGxQTFRF9vj/9uGb9vX09fPn989R9eSl9eSm9tJb99Rl9fHc9eex9fTo9evH9Om89dyF9tFa9dp79eax9fHd9tdw9vXz9tdv9eq89e7S9fDd9d6P9e7R9d+Q9vj+989S9tJa9em89fPo9eew9tp699Vm8/jTiwAAACR0Uk5TAP8Z//////////////////////8y/////////wD/////////WF554gAAAMlJREFUeJyFktkWgjAMBVMIWNlaARdUxOX//9HSIocGGvME5w5TLgTAHxEBOzEmPJDijlXEEnlFisgqRgGrGAWcwgkYhRMYRSDfTwLEjBySF6WopMLFKC0ORe28jZf4I3UO7TGcI56MgiHU2R4SJNRleskAMecAUcXnZro/+ZqQJIcrAW70O5cEaCggCEB/2F0ToM8J8KAtCh9o53a/i2yzhBzg2W3WeNmnE7so8Xu8+axKTLH1md3qSYlFbD+L7GuPSFarXrpdgC+z9gvgcfNgTwAAAABJRU5ErkJggg==" />
              </defs>
              <use id="Background" href="#img1" x="6" y="7" />
            </svg>
				</div>

				<span class="stars__average-rating-score"> 4.7 / 5 </span>
			</div>
			<div class="average-ratings__total-customers"><%=mapListReview.size() %> đánh giá</div>
		</div>

		<%if(!arrayStar.isEmpty()) { %>	
		<div class="reviews__breakdown">
			<div class="reviews-breakdown__wrapper">
				<div class="reviews__single-star-average">
					<div class="single-star-average__amount">5 star</div>
					<div class="single-star-average__progress-bar">
						<progress class="progress-bar__data" max="<%=mapListReview.size() %>" value="<%=arrayStar.get(0) %>"></progress>
					</div>
					<div class="single-star-average__percentage"><%=arrayStar.get(0) %>/<%=mapListReview.size() %></div>
				</div> 
				<div class="reviews__single-star-average">
					<div class="single-star-average__amount">4 star</div>
					<div class="single-star-average__progress-bar">
						<progress class="progress-bar__data" max="<%=mapListReview.size() %>" value="<%=arrayStar.get(1) %>"></progress>
					</div>
					<div class="single-star-average__percentage"><%=arrayStar.get(1) %>/<%=mapListReview.size() %></div>
				</div>

				<div class="reviews__single-star-average">
					<div class="single-star-average__amount">3 star</div>
					<div class="single-star-average__progress-bar">
						<progress class="progress-bar__data" max="<%=mapListReview.size() %>" value="<%=arrayStar.get(2) %>"></progress>
					</div>
					<div class="single-star-average__percentage"><%=arrayStar.get(2) %>/<%=mapListReview.size() %></div>
				</div>

				<div class="reviews__single-star-average">
					<div class="single-star-average__amount">2 star</div>
					<div class="single-star-average__progress-bar">
						<progress class="progress-bar__data" max="<%=mapListReview.size() %>" value="<%=arrayStar.get(3) %>"></progress>
					</div>
					<div class="single-star-average__percentage"><%=arrayStar.get(3) %>/<%=mapListReview.size() %></div>
				</div>

				<div class="reviews__single-star-average">
					<div class="single-star-average__amount">1 star</div>
					<div class="single-star-average__progress-bar">
						<progress class="progress-bar__data" max="<%=mapListReview.size() %>" value="<%=arrayStar.get(4) %>"></progress>
					</div>
					<div class="single-star-average__percentage"><%=arrayStar.get(4) %>/<%=mapListReview.size() %></div>
				</div>
			</div>
		</div>
		<% }%>
	</div>
</body>
</html>