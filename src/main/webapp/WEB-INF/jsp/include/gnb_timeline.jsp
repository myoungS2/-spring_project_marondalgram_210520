<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="ml-3 mt-3">
		<a id="timelineLogo" href="/timeline/list_view">Marondalgram</a>
	</div>
	<div class="mr-3 mt-3">
		<%-- 로그인 되어있으면 myprofile보여주고, 로그아웃 되어있으면 sign in보여주기 --%>
		<c:if test="${empty userId}">
			<a id="signinHref" href="/user/sign_in_view">sign in</a>
		</c:if>
		<c:if test="${not empty userId}">
			<a id="myprofile" href="/user/profile_view"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAgVBMVEX///8AAAB1dXWXl5fs7OzR0dH7+/vg4ODm5ub4+Pje3t47Ozvj4+NCQkLJyckgICDy8vKdnZ22trYuLi6lpaVVVVVhYWGNjY1sbGxaWloYGBiysrLCwsK6urqTk5NJSUkSEhJ+fn5oaGiDg4MkJCQ1NTULCwtHR0c2NjZPT0/Ozs5NNl5mAAAEqElEQVR4nO3di3aiMBQF0IaHAgUBBQUBrdra6v9/4FhnzdhWkEcu5mLP/oKcFcw78ekJAAAAAAAAAAAAAAAAAAAA4OHYhuWaRRTqYVQcXcsIVBeIlmUWu8NSXLysN9lxPFJdLiJGHs1fRIk4zC3VhSNgRclrWbwzfxs6qgsoKdDj0ur7b39YGKoLKWPq7W/mO3uOVBezM3deH+/sYKouaid25jcMeBIOsPMwFs3znWzGqgvclpO0CihEOrAv1YlbBjw1OBPVhW7DPLQOKISXqy52cx1q8BxxMLVoNe0lfjoMZIATaB0DCrEdxDh1FHYOKMTCVl38BvJlfZBqU9XFrxd0aUYv3vh/p+2GMtc01QHqWJIBheA+ttlKJ1yrjnDbscF8sA7vxqbteLtMqjrELeYHQcIZ5/HpiiCgEDvVMaoZXQek38V8h6f5jCThMlMdpFJEElAIXXWQKkb3ScV3c66LNqZHlHDGdSqcE3T3fxWqo1TIqAKKiOeulC0z9f1ux3OBONiQJZzznCV2XoC69s6zMXXlZvdfzXiOasZUnYUQPtOEz2QJlzwTOg+f8PG/0sdvaQh7C49nb0E2tRAi5dnj2zpZwg3PUdvjj7x/wezp8WfAZE1NyrMpPaGaIC5UB6lUVJ9CbGPPdzWRaEWY84GFh1/V/wU7MzS7a6zPYxDskO5575A+ybc1nuoINVzphEfVEersJAPOVQeoZcut1vgDOLk/aXG8+wr3ZuZMaiK8Y91T/CMxxWC6X3Fl3O2IsBBr7ie+/uu4Nsx24lvC6TKNWrIej/7ktj934g/mE/3LbftbHM5v8B9rc/ta3g8J41lvlSBqPlmc6QMYylwbmU2P06aTQXT0JYKi0ZcaMV3DbySoX7nhukfRmB161Rcwls+Loef7NCq0Q9kI4HWtZUP9/V0xpqtN+nyZVi0/Ym2VuaqLRWs0nhRZFOq6HkbZdOI8TO0BAAAAAAAAwKMY2UFgWGYe6TttnsZxnM61zSrKTdcIAnvYixm24TpmoWuHqo2o13Wymh6dsTHEnKdKm+rJe6M1by9ZZacqZXq2u4x7+iITr9XWk9g/b09fLtuzwV/Yub5J31qFu5jF2qpgvQtlRKffnOTZvdk6CZlWpaGvfZrrCHvfW3ALaVshzRHvi5cFn2XxYDzteoDmtnXmcNiZsvIddfVdLDXlzasZyT8MdVsamQo7SnNBd6mymrdTdVbK1Ogu/t72tlWR0dBkzpG25c/vfd6m5SvBFLR7nswMpl3HZTL86G4DuiPdhd925vf5OQZZf/1fnf09qtHZKMv3Sev9COOknwFac17Pd4QLmhfZZPi9/tEA3X10GWF/wziqF+dkLfqKyKMGP4X9BMxV5/qil7vQJDdgqfRxNcOguABLJ6U/2BiRPXpBg/x9TPNddaQfqL9Tqcfy+0F8fprwHS8qr7Qj1KnqPCVIn+mR+MuK/sSUMylD3ZTwBsplDUd1mFKUrSmnAdsF5TSKy6TiO8pXXuheYqNE+WcfSKgGEiIhEqqHhEiIhOohIRIioXpIiIS/KyHN27LUEsKEeaLxk/B9UBkAAAAAAAAAAAAAAAAAAAB+qz/Ur1izYu5ZcQAAAABJRU5ErkJggg==" width="30" height="30" alt="profile"></a>
			
		</c:if>
	</div>
