import SwiftUI

struct HomePage: View {
    @State private var selectedDate = Date()
    @State private var selectedMealTypes: [String] = ["Breakfast", "Lunch", "Snack", "Dinner"]
    @State private var selectedDietaryPreferences: [String] = []
    @State private var selectedAllergies: [String] = []
    @EnvironmentObject var fontSettings: FontSettings
    
    // Pass selected filters to DetailedMealView
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(selectedMealTypes: $selectedMealTypes, selectedDietaryPreferences: $selectedDietaryPreferences, selectedAllergies: $selectedAllergies)
                
                // Calendar
                CalendarView(selectedDate: $selectedDate)
                

                
                // Meal Sections
                ScrollView {
                    VStack(spacing: 20) {
                        if selectedMealTypes.contains("Breakfast") {
                            MealCarouselView(mealTime: "Breakfast", servingTime: "7:00 AM - 9:00 AM", meals: generateMeals(for: selectedDate, mealTime: "Breakfast", dietaryPreferences: selectedDietaryPreferences, allergies: selectedAllergies))
                        }
                        if selectedMealTypes.contains("Lunch") {
                            MealCarouselView(mealTime: "Lunch", servingTime: "12:00 PM - 2:00 PM", meals: generateMeals(for: selectedDate, mealTime: "Lunch", dietaryPreferences: selectedDietaryPreferences, allergies: selectedAllergies))
                        }
                        if selectedMealTypes.contains("Snack") {
                            MealCarouselView(mealTime: "Snack", servingTime: "3:00 PM - 4:00 PM", meals: generateMeals(for: selectedDate, mealTime: "Snack", dietaryPreferences: selectedDietaryPreferences, allergies: selectedAllergies))
                        }
                        if selectedMealTypes.contains("Dinner") {
                            MealCarouselView(mealTime: "Dinner", servingTime: "6:00 PM - 8:00 PM", meals: generateMeals(for: selectedDate, mealTime: "Dinner", dietaryPreferences: selectedDietaryPreferences, allergies: selectedAllergies))
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HeaderView: View {
    @Binding var selectedMealTypes: [String]
    @Binding var selectedDietaryPreferences: [String]
    @Binding var selectedAllergies: [String]
    @EnvironmentObject var fontSettings: FontSettings
    
    var body: some View {
        HStack {
            NavigationLink(destination: FilterPage(selectedMealTypes: $selectedMealTypes, selectedDietaryPreferences: $selectedDietaryPreferences, selectedAllergies: $selectedAllergies)) {
                Image(systemName: "line.horizontal.3.decrease.circle.fill")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.purple)
            }
            
            Spacer()
            
            NavigationLink(destination: ProfilePage()) {
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.purple)
            }
        }
        .background(Color(.systemGray6))
    }
}

struct FilterPage: View {
    @Binding var selectedMealTypes: [String]
    @Binding var selectedDietaryPreferences: [String]
    @Binding var selectedAllergies: [String]
    @EnvironmentObject var fontSettings: FontSettings
    
    let mealTypes = ["Breakfast", "Lunch", "Snack", "Dinner"]
    let dietaryPreferences = ["Vegan", "Vegetarian", "Gluten-Free", "Dairy-Free"]
    let allergies = ["Peanuts", "Tree Nuts", "Shellfish", "Wheat"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Meal Types Section
                FilterSection(header: "Meal Types", options: mealTypes, selectedOptions: $selectedMealTypes)
                
                // Dietary Preferences Section
                FilterSection(header: "Dietary Preferences", options: dietaryPreferences, selectedOptions: $selectedDietaryPreferences)
                
                // Allergies Section
                FilterSection(header: "Allergies", options: allergies, selectedOptions: $selectedAllergies)
            }
            .padding()
        }
        .navigationBarTitle("Filter Options")
    }
}

struct FilterSection: View {
    let header: String
    let options: [String]
    @EnvironmentObject var fontSettings: FontSettings
    
    @Binding var selectedOptions: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.headline)
                .padding(.bottom, 5)
            
            VStack(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedOptions.contains(option) {
                            selectedOptions.removeAll { $0 == option }
                        } else {
                            selectedOptions.append(option)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(.systemGray3))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MealCarouselView: View {
    @EnvironmentObject var fontSettings: FontSettings
    var mealTime: String
    var servingTime: String
    var meals: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(mealTime)
                    .font(.title)
                    .fontWeight(.bold).italic()
                    .padding(.bottom, 5)
                
                Spacer()
                
                Text(servingTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                ForEach(meals, id: \.self) { meal in
                    NavigationLink(
                        destination: DetailedMealView(
                            mealTime: mealTime,
                            meal: meal,
                            ingredients: "",
                            nutritionalValue: "",
                            calories: "",
                            dietaryInfo: "" // Empty string for dietary info
                        )
                    ) {
                        Text(meal)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.bottom, 10)
                    }
                }
            }
        }
        .padding()
    }
}

struct DetailedMealView: View {
    @EnvironmentObject var fontSettings: FontSettings
    var mealTime: String
    var meal: String
    var ingredients: String
    var nutritionalValue: String
    var calories: String
    var dietaryInfo: String
    
    var showDietaryInfo: Bool {
        !dietaryInfo.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(meal)")
                .font(.largeTitle)
                .padding()
                .padding(.top, 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Ingredients: \(ingredients)")
                        .padding(.bottom, 10)
                    Text("Nutritional Value: \(nutritionalValue)")
                        .padding(.bottom, 10)
                    Text("Calories: \(calories)")
                        .padding(.bottom, 10)
                    if showDietaryInfo {
                        Text("Dietary Restrictions & Allergies: Present")
                            .font(.headline)
                            .padding(.bottom, 10)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    Text("REVIEWS")
                        .font(.largeTitle)
                        .padding(.top, 30)
                        .bold()
                        .italic()
                    
                    // Use ReviewsRow from ReviewsPage instead of ReviewRow
                    ReviewsRow(username: "User 1", reviewText: "Horrible meal. RUN. 🫠", rating: 0.5)
                    ReviewsRow(username: "User 2", reviewText: "Decent meal", rating: 3.0)
                    ReviewsRow(username: "User 3", reviewText: "Ngl this meal did not eat. If I could give it a minus I would.👎🏾", rating: 1.0)
                    ReviewsRow(username: "User 4", reviewText: "Would not recommend", rating: 2.0)
                    ReviewsRow(username: "User 5", reviewText: "I don't know about these other comments but I actually LIKED it.", rating: 4.5)
                    
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Meal Details", displayMode: .inline)
            .padding()
        }
    }
}

struct ReviewRow: View {
    @EnvironmentObject var fontSettings: FontSettings
    var username: String
    var reviewText: String
    var rating: Double
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(username)
                        .font(.headline)
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .padding(.top, 5)
                        Text("\(String(format: "%.1f", rating))")
                            .font(.headline)
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 15)
                }
                
                Text(reviewText)
                    .font(.system(size: fontSettings.fontSize))
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .background(Color(.systemGray5))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

//struct DetailedMealView: View {
//    @EnvironmentObject var fontSettings: FontSettings
//    var mealTime: String
//    var meal: String
//    var ingredients: String
//    var nutritionalValue: String
//    var calories: String
//    var dietaryInfo: String
//    
//    var showDietaryInfo: Bool {
//        !dietaryInfo.isEmpty
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("\(meal)")
//                .font(.largeTitle)
//                .padding()
//                .padding(.top, 20)
//            
//            ScrollView {
//                VStack(alignment: .leading, spacing: 15) {
//                    Text("Ingredients: \(ingredients)")
//                        .padding(.bottom, 10)
//                    Text("Nutritional Value: \(nutritionalValue)")
//                        .padding(.bottom, 10)
//                    Text("Calories: \(calories)")
//                        .padding(.bottom, 10)
//                    if showDietaryInfo {
//                        Text("Dietary Restrictions & Allergies: Present")
//                            .font(.headline)
//                            .padding(.bottom, 10)
//                    }
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(Color(.systemGray5))
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                .padding(.bottom, 10)
//                
//                VStack(alignment: .leading) {
//                    Text("REVIEWS")
//                        .font(.largeTitle)
//                        .padding(.top, 30)
//                        .bold()
//                        .italic()
//                    
//                    // Updated review section with rectangular carousels
//                    ForEach(0..<4) { index in
//                        ReviewRow(username: "Other_user \(index + 1)")
//                            .padding(.bottom, 10) // Add spacing between reviews
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .navigationBarTitle("Meal Details", displayMode: .inline)
//            .padding()
//        }
//    }
//}
//
//
//struct ReviewRow: View {
//    @EnvironmentObject var fontSettings: FontSettings
//    var username: String
//    
//    var body: some View {
//        HStack(alignment: .top) { // Align content to the top
//            Image(systemName: "person.crop.circle").padding()
//                .font(.largeTitle)
//                .foregroundColor(.purple)
//                .padding(.top, 5) // Adjust top padding to position image lower
//            
//            VStack(alignment: .leading) {
//                Text(username)
//                    .font(.headline)
//                    .padding(.horizontal, 15) // Adjust horizontal padding as needed
//                    .padding(.top, 30) // Adjust top padding to position text lower
//            }
//            
//        }
//        .frame(maxWidth: .infinity, alignment: .leading) // Align content to the left
//        .padding(.vertical, 8)
//        .background(Color(.systemGray5))
//        .cornerRadius(15)
//        .shadow(radius: 5)
//        /*padding(.horizontal)*/ // Add horizontal padding for better appearance
//        .padding(.vertical, 8) // Add vertical padding for spacing between rows
//    }
//    
//}

func generateDietaryInfo(dietaryPreferences: [String], allergies: [String]) -> String {
    var info = ""
    
    if !dietaryPreferences.isEmpty {
        info += "Dietary Preferences: \(dietaryPreferences.joined(separator: ", "))\n"
    }
    if !allergies.isEmpty {
        info += "Allergies: \(allergies.joined(separator: ", "))"
    }
    
    return info
}

func generateMeals(for date: Date, mealTime: String, dietaryPreferences: [String], allergies: [String]) -> [String] {
    let dayOfWeek = Calendar.current.component(.weekday, from: date)
    
    var meals = [String]()
    
    switch mealTime {
    case "Breakfast":
        switch dayOfWeek {
        case 1: meals = ["Meal 1: Pancakes", "Meal 2: Omelette", "Meal 3: Smoothie"]
        case 2: meals = ["Meal 1: Scrambled Eggs", "Meal 2: Toast", "Meal 3: Fruit Salad"]
        case 3: meals = ["Meal 1: Bagels", "Meal 2: Yogurt", "Meal 3: Granola"]
        case 4: meals = ["Meal 1: Waffles", "Meal 2: Sausages", "Meal 3: Berries"]
        case 5: meals = ["Meal 1: French Toast", "Meal 2: Bacon", "Meal 3: Orange Juice"]
        case 6: meals = ["Meal 1: Cereal", "Meal 2: Banana", "Meal 3: Milk"]
        case 7: meals = ["Meal 1: Muffins", "Meal 2: Eggs Benedict", "Meal 3: Coffee"]
        default: meals = ["Meal 1: Default Breakfast", "Meal 2: Default Breakfast", "Meal 3: Default Breakfast"]
        }
    case "Lunch":
        switch dayOfWeek {
        case 1: meals = ["Meal 1: Grilled Chicken", "Meal 2: Salad", "Meal 3: Soup"]
        case 2: meals = ["Meal 1: Veggie Wrap", "Meal 2: Burger", "Meal 3: Chicken & Fries"]
        case 3: meals = ["Meal 1: Sushi", "Meal 2: Ramen", "Meal 3: Spring Rolls"]
        case 4: meals = ["Meal 1: Pizza", "Meal 2: Caesar Salad", "Meal 3: Breadsticks"]
        case 5: meals = ["Meal 1: Tacos", "Meal 2: Rice and Beans", "Meal 3: Salsa"]
        case 6: meals = ["Meal 1: BBQ Ribs", "Meal 2: Cornbread", "Meal 3: Coleslaw"]
        case 7: meals = ["Meal 1: Fish and Chips", "Meal 2: Peas", "Meal 3: Tartar Sauce"]
        default: meals = ["Meal 1: Default Lunch", "Meal 2: Default Lunch", "Meal 3: Default Lunch"]
        }
    case "Snack":
        switch dayOfWeek {
        case 1: meals = ["Meal 1: Cookies", "Meal 2: Apple", "Meal 3: Yogurt"]
        case 2: meals = ["Meal 1: Granola Bar", "Meal 2: Fruits", "Meal 3: Cheese"]
        case 3: meals = ["Meal 1: Pretzels", "Meal 2: Hummus", "Meal 3: Carrots"]
        case 4: meals = ["Meal 1: Trail Mix", "Meal 2: Celery Sticks", "Meal 3: Peanut Butter"]
        case 5: meals = ["Meal 1: Popcorn", "Meal 2: Grapes", "Meal 3: Cheese Cubes"]
        case 6: meals = ["Meal 1: Fruit Salad", "Meal 2: Crackers", "Meal 3: Ham Slices"]
        case 7: meals = ["Meal 1: Smoothie", "Meal 2: Nuts", "Meal 3: Berries"]
        default: meals = ["Meal 1: Default Snack", "Meal 2: Default Snack", "Meal 3: Default Snack"]
        }
    case "Dinner":
        switch dayOfWeek {
        case 1: meals = ["Meal 1: Steak", "Meal 2: Mashed Potatoes", "Meal 3: Vegetables"]
        case 2: meals = ["Meal 1: Pasta", "Meal 2: Garlic Bread", "Meal 3: Salad"]
        case 3: meals = ["Meal 1: Chicken Curry", "Meal 2: Rice", "Meal 3: Naan"]
        case 4: meals = ["Meal 1: Beef Stir Fry", "Meal 2: Noodles", "Meal 3: Egg Rolls"]
        case 5: meals = ["Meal 1: Baked Salmon", "Meal 2: Quinoa", "Meal 3: Asparagus"]
        case 6: meals = ["Meal 1: Tacos", "Meal 2: Refried Beans", "Meal 3: Guacamole"]
        case 7: meals = ["Meal 1: Pizza", "Meal 2: Garlic Knots", "Meal 3: Caesar Salad"]
        default: meals = ["Meal 1: Default Dinner", "Meal 2: Default Dinner", "Meal 3: Default Dinner"]
        }
    default:
        meals = ["Meal 1: Food", "Meal 2: More Food", "Meal 3: Even More Food"]
    }
    
    // No dietary info appended
    return meals
}







