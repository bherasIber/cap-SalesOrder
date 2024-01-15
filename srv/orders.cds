using com.logali.sales as logali from '../db/schema';

service ManageOrders {

     entity Orders    as projection on logali.Orders;
     entity Items     as projection on logali.OrderItems;

}
