class PackageService

  def get_all_packages
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_all_packages end"}
    packages_map = []
    begin
      packs = SubscriptionPack.all
      if packs.present?
        packs.each do |p|
          packages = SubscriptionPackage.where(:subscription_packs_id => p.id)
          if packages.present?
            pack_map = Maps.packs_map(p, packages)
            packages_map.push(pack_map)
          end
        end
      end
    rescue => e
      Rails.logger.info{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_all_packages start"}
    return packages_map
  end
  
  def get_package(params)
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_package start"}
    response = {}
    begin
      if params[:package_id].present?
        package = SubscriptionPackage.find_by_id(params[:package_id])
        if package.present?
          package_map = Maps.package_map(package)
          message = I18n.translate :package_not_present
        response = {:success => true, :data => package_map, :message => message}
        else
          message = I18n.translate :package_not_present
          response = {:success => false, :message => message}
        end
      else
        message = I18n.translate :package_not_present
        response = {:success => false, :message => message}
      end
    rescue => e
      Rails.logger.error{"#{__FILE__}: #{__LINE__} Exception : #{e.message}"}
    end
    Rails.logger.info{"#{__FILE__}: #{__LINE__} get_package end"}
    return response
  end
end
