// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum AddRecipe: StoryboardType {
    internal static let storyboardName = "AddRecipe"

    internal static let addRecipeViewController = SceneType<AddRecipeViewController>(storyboard: AddRecipe.self, identifier: "AddRecipeViewController")
  }
  internal enum DietaryRequirements: StoryboardType {
    internal static let storyboardName = "DietaryRequirements"

    internal static let dietaryRequirementsViewController = SceneType<DietaryRequirementsViewController>(storyboard: DietaryRequirements.self, identifier: "DietaryRequirementsViewController")
  }
  internal enum Home: StoryboardType {
    internal static let storyboardName = "Home"

    internal static let homeViewController = SceneType<HomeViewController>(storyboard: Home.self, identifier: "HomeViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<ViewController>(storyboard: Main.self)
  }
  internal enum Profile: StoryboardType {
    internal static let storyboardName = "Profile"

    internal static let profileViewController = SceneType<ProfileViewController>(storyboard: Profile.self, identifier: "ProfileViewController")
  }
  internal enum RecipeDetails: StoryboardType {
    internal static let storyboardName = "RecipeDetails"

    internal static let recipeDetailsViewController = SceneType<RecipeDetailsViewController>(storyboard: RecipeDetails.self, identifier: "RecipeDetailsViewController")
  }
  internal enum RecipeList: StoryboardType {
    internal static let storyboardName = "RecipeList"

    internal static let recipeListViewController = SceneType<RecipeListViewController>(storyboard: RecipeList.self, identifier: "RecipeListViewController")
  }
  internal enum RegisterName: StoryboardType {
    internal static let storyboardName = "RegisterName"

    internal static let registerNameViewController = SceneType<RegisterNameViewController>(storyboard: RegisterName.self, identifier: "RegisterNameViewController")
  }
  internal enum Settings: StoryboardType {
    internal static let storyboardName = "Settings"

    internal static let settingsViewController = SceneType<SettingsViewController>(storyboard: Settings.self, identifier: "SettingsViewController")
  }
  internal enum ShoppingEssentials: StoryboardType {
    internal static let storyboardName = "ShoppingEssentials"

    internal static let shoppingEssentialsViewController = SceneType<ShoppingEssentialsViewController>(storyboard: ShoppingEssentials.self, identifier: "ShoppingEssentialsViewController")
  }
  internal enum Signup: StoryboardType {
    internal static let storyboardName = "Signup"

    internal static let signupViewController = SceneType<SignupViewController>(storyboard: Signup.self, identifier: "SignupViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

private final class BundleToken {}
