<%@page import="Entity.UnexpectedCost"%>

<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Order customer</a>
    </li>
    <li class="breadcrumb-item active">New Unexpected Cost</li>
</ol>

<form action="/RestaurantManagement/unexpected-cost" method="post">
    <h1>Unexpected Cost</h1>
    <div class="row">
         <div class="col-6">
           <select name="kind">
           <option name="kind"value=2 >Month</option>
           <option name="kind" value= 1 selected>Day</option>
          </select>
            <div class="form-group">
                <label style="font-weight: bold">Content
<!--                <spring:nestedPath path="content">
                    <spring:bind path="value">-->
                        <input type="text" class="form-control" id="exampleFormControlInput1" name="content">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
            
        
         
            <div class="form-group">
                <label style="font-weight: bold">Cost</label>
<!--                <spring:nestedPath path="cost">
                    <spring:bind path="value">-->
                        <input type="number" class="form-control" id="exampleFormControlInput1" name="cost">
<!--                    </spring:bind>
                </spring:nestedPath>-->
            </div>
             
            
            <div class="form-group text-center">
                <input class="btn btn-primary btn-lg btn-sm" type="submit" value="Add Cost">
            </div>
           
     </div>
     
     
             
            
            
        
    </div>

    
</form>