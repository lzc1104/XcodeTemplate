#
#  Be sure to run `pod spec lint Protos.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "Proto"
  s.version      = "0.0.59"
  s.summary      = "This a Protos of protobuf generates files"
  s.ios.deployment_target = "9.0"
  s.homepage     = "http://cn.bing.com"
  s.license      = "MIT"
  s.author       = { "lzc1104" => "527004184@QQ.COM" }
  s.source       = { :git => 'https://github.com/google/protobuf.git' }

  s.source_files  = "Protos/**/*"
  # s.dependency "Protobuf"
  src = "./PBEntities"
  pods_root = 'Pods'
  dir = "#{pods_root}/#{s.name}"
  protoc = "/usr/local/bin/protoc"
  s.prepare_command = <<-CMD
    mkdir -p #{dir}
        #{protoc} \
        --swift_out=#{dir} \
        --swift_opt=Visibility=Public \
        -I #{src} \
        #{src}/*.proto
  CMD

  s.subspec "Message" do |ms|
    ms.source_files = "#{dir}/*.pb.swift","#{dir}/**/*.pb.swift"
    ms.header_mappings_dir = dir
    ms.dependency "SwiftProtobuf"
  end



end
