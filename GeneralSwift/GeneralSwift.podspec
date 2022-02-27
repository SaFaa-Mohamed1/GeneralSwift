Pod::Spec.new do |spec|

  spec.name         = "GeneralSwift"
  spec.version      = "1.0.2"
  spec.summary      = "General functions"
  spec.description  = "General framework Contains The most used functions in applications"
  spec.homepage     = "https://github.com/SaFaa-Mohamed1/GeneralSwift"
  spec.license      = "MIT"
  spec.author       = { "safaa" => "safaam673@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/SaFaa-Mohamed1/GeneralSwift.git", :tag => spec.version.to_s }
  spec.source_files  = '**/GeneralSwift/**/*.{swift}'
  spec.swift_versions = "4.0"
end
