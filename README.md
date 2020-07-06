# ParkingLotAssignment

Instructions :
1. The parking lot has multiple levels. Each level has multiple rows of spots.
2. The parking lot can park motorcycles, cars, and buses.
3. The parking lot has motorcycle spots, compact spots, and large spots.
4. A motorcycle can park in any spot.
5. A car can park in either a single compact spot or a single large spot.
6. A bus can park in five large spots that are consecutive and within the same row.
It cannot park in small spots.
7. The parking must be filled in a linear fashion i.e user should not be allotted a slot
on level 2 if level 1 still has space for his vehicle.
8. The same linear approach should be followed within the same level as well. The
allotment should not be random.
9. From the front end, only the vehicle type will be provided and the APIs will return
the slot for the vehicle.
10. Also, the system should be able to display the count of each kind of vehicle
present at the lot at any point of time.
11. The vehicle slot and type can also be fetched using the registration number and
vice-versa.

# Instructions
- Pods are used for dependency management
- Please install pods and run pod install for the code to compile.

# Solutions
The project is created and compiled with XCode. Programming language:- Swift. Dummy data added via CSV file.

Since we do not have multiple inheritance and abstract classes in swift, and i am using Realm for managing data, the following approach is used.
Slot object contains slot related data: id, row, level, slot type and vehicle.
Vehicle object contains vehicle related data: license, vehicle type, spotsRequired and slots alloted. Methods to add slot and remove slots.

SlotManager and VehicleManager are responsible to retrive and save data to the databases.

AddVehicle, Dashboard and VehicleListing are related to Views

Other files are helper methods.


