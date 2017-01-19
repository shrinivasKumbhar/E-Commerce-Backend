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
end
