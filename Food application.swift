import UIKit
import SwiftUI

struct SecondView: View {
  var body: some View {
      VStack {
          Text("Second View").font(.system(size: 36))
          Text("Loaded by SecondView").font(.system(size: 14))
      }
  }
}

class ChildHostingController: UIHostingController<SecondView> {
   
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: SecondView())
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
    }
import Foundation
import wxSwift
let program_path = Bundle.main.executablePath!
let installed_dir = URL(fileURWithPath: program_path, relativeTo: nil)
    .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
						.path


let current_dir = FileManager.default.currentDirectoryPath      


var swift_source : String = ""
var swift_out_exe : String = ""
var swift_compiler_exe : String = installed_dir + "\\bin\\swiftc.exe"
var swift_src_dir : String = installed_dir + "\\Samples"
var swift_logo_ico : String = "swift_logo"
var run_path : String = installed_dir + "\\bin\\run.bat"
var swift_cmd : String = installed_dir + "\\swift-cmd.bat"
var runtime_env_dir : String = installed_dir + "\\RuntimeEnv"
var sfwbuild_path : String = installed_dir + "\\bin\\sfwbuild.exe"

var swift_version_string = ""
var compile_target = ""
 
var config_subsystem = "console"
var binary_strip = "No"

var app = wx.App()

let fileman = FileManager()
if fileman.fileExists(atPath: swift_compiler_exe) {
	let exec_output = wx.executeOutErr("\(swift_compiler_exe) --version")
	let stringToSplit = exec_output.components(separatedBy: "\n")
	swift_version_string = stringToSplit[0]
	if stringToSplit[1].hasPrefix("Target: ") {
		compile_target = stringToSplit[1]
		let index = compile_target.index(compile_target.startIndex, offsetBy: 8)
		compile_target = String(compile_target[index...])
	} else {
		compile_target = stringToSplit[1]
	}
} else {
	swift_compiler_exe = "Compiler is not found !"
}

var controller = SfwController()
controller.showFrame()
app.mainLoop()
}