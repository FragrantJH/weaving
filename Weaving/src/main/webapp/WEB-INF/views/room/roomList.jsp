<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-6">
      <div class="card">
          <div class="card-header card-header-text card-header-primary">
            <div class="card-text">
              <h4 class="card-title">회의실 예약</h4>

            </div>
          </div>
          <div class="card-body">
<table class="table">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th>회의실</th>
            <th>예약자</th>
            <th>예약시간</th>
            <th class="text-right">사용용도</th>
            <th class="text-right">액션</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>마케팅부서</td>
            <td>김대리</td>
            <td>2013</td>
            <td class="text-right">&euro; 정기회의</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info">
                    <i class="material-icons">person</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success">
                    <i class="material-icons">edit</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger">
                    <i class="material-icons">close</i>
                </button>
            </td>
        </tr>
        <tr>
            <td class="text-center">2</td>
            <td>전략기획팀</td>
            <td>김과장</td>
            <td>2012</td>
            <td class="text-right">&euro; 긴급회의</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info btn-round">
                    <i class="material-icons">person</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success btn-round">
                    <i class="material-icons">edit</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger btn-round">
                    <i class="material-icons">close</i>
                </button>
            </td>
        </tr>
        <tr>
            <td class="text-center">3</td>
            <td>회계팀</td>
            <td>김과장</td>
            <td>2010</td>
            <td class="text-right">&euro; 인사이동</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info btn-simple">
                    <i class="material-icons">person</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success btn-simple">
                    <i class="material-icons">edit</i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger btn-simple">
                    <i class="material-icons">close</i>
                </button>
            </td>
        </tr>
    </tbody>
</table>
          </div>
      </div>
  </div>
</div>
</body>
</html>