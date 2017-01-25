class PackagesController < ApplicationController

  def get_all_packages
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_all_packages end"}
    begin
      render :json => PackageService.new.get_all_packages()
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_all_packages start"}
  end
  
  def get_package_detail
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_package_detail start"}
    begin
      render :json => PackageService.new.get_package(params)
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_package_detail end"}
  end
end
