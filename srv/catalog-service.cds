using com.logali.sales as logali from '../db/schema';

define service CatalogService {

    entity Order @(
        Capabilities.Insertable: true,
        Capabilities.Updatable: true 
    ) as
        select from logali.Orders {
            Email       @mandatory,
            FirstName,
            LastName,
            Country,
            CreatedOn,
            OrderStatus @readonly,
            DeliveryDate,
            ImageUrl,
            to_Items
        };

    entity Item  as
        select from logali.OrderItems {
            ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Price,
            Height,
            Width,
            Depth,
            Quantity @(
                mandatory,
                assert.range : [
                    0.00,
                    20.00
                ]
            ),
            to_Orders
        };
}
