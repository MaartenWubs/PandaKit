![PandaKitLogo](https://user-images.githubusercontent.com/64893914/153651028-6d27069e-8c86-4dc6-b528-3dc122f1adac.png)

## Welcome to PandaKit

PandaKit is a swift package that I created because I discovered that I often go back to writing the same code in different
projects. PandaKit is desinged to get rid of complicated code that is often used in building userr interfaces. 


## installation

You can install this package using Xcode's package manager.

## Usage 

Once added, you only have to import PandaKit in the file you want to use it.


```PandaKit``` is fully compatible with ```UIkit``` and other standard Apple frameworks.

### Collections

```PNDADatasourceController``` is created to replace the usage of ```UICollectionViewController``` and to 
make the use and creation of cells easier by providing all the information into ```PNDADatasource```. PandaKit
will then relay all the data to the correct place for your list view.

``` swift
class YourDatasourceClass: PNDADatasource {

    let users = ["user1", "user2", "user3"]

    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func cellClasses() -> [PNDADatasourceCell.Type] {
        return [YourCellClass.self]
    }
    
}
```

These methods are much smaller and take a lot of the basic UICollectioView configuartion code of your hands. You 
only need to initiate your datasource class in to your datasource controller.

``` swift
class YourDatasourceController: PNDADatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let yourDatasource = YourDatasourceClass()
        self.datasource = yourDatasource
    }
}
```

