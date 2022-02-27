Pod::Spec.new do |spec|

  spec.name         = "GeneralSwift"
  spec.version      = "1.0.1"
  spec.summary      = "General functions"
  spec.description  = "General framework Contains The most used functions in applications"
  spec.homepage     = "https://github.com/SaFaa-Mohamed1/GeneralSwift"
  spec.license      = "MIT"
  spec.author       = { "safaa" => "safaam673@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/SaFaa-Mohamed1/GeneralSwift.git", :tag => spec.version.to_s }
  spec.source_files  = "GeneralSwift/GeneralSwift/*.{swift}"
  spec.swift_versions = "4.0"
end
