//import SwiftUI
//
//struct FilterPage: View {
//    @Binding var selectedMealTypes: [String]
//    @Binding var selectedDietaryPreferences: [String]
//    @Binding var selectedAllergies: [String]
//    
//    let mealTypes = ["Breakfast", "Lunch", "Snack", "Dinner"]
//    let dietaryPreferences = ["Vegan", "Vegetarian", "Gluten-Free", "Dairy-Free"]
//    let allergies = ["Peanuts", "Tree Nuts", "Shellfish", "Wheat"]
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Meal Types Section
//                FilterSection(header: "Meal Types", options: mealTypes, selectedOptions: $selectedMealTypes)
//                
//                // Dietary Preferences Section
//                FilterSection(header: "Dietary Preferences", options: dietaryPreferences, selectedOptions: $selectedDietaryPreferences)
//                
//                // Allergies Section
//                FilterSection(header: "Allergies", options: allergies, selectedOptions: $selectedAllergies)
//            }
//            .padding()
//        }
//        .navigationBarTitle("Filter Options")
//    }
//}
//
//struct FilterPage_Previews: PreviewProvider {
//    @State static var selectedDietaryPreferences: [String] = []
//    @State static var selectedAllergies: [String] = []
//    
//    static var previews: some View {
//        FilterPage(selectedDietaryPreferences: $selectedDietaryPreferences, selectedAllergies: $selectedAllergies)
//    }
//}
