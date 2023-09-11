for mousei = 17:17 %16
    disp(mousei)
    mat = load(['/N/slate/zw72/average_per_mice_new/Mouse' num2str(mousei) '.mat']);
    all_images = {};
    for time = 1:5
        disp(time)
        ids = find(mat.isbrain);
        n_pixel = length(ids);
        data_matrix = reshape(mat.all_average_data(time,:,:),[],2500);
        data_matrix = data_matrix(ids,:);
        [coeff,score,latent,tsquared,explained,mu] = pca(data_matrix');
        cumulative_explained = cumsum(explained);
        n_components = sum(cumulative_explained<95);
        [weights,sphere,compvars,bias,signs,lrates,activations] = runica(coeff(1:n_components,:),'stop',1e-10,'anneal',0.3,'maxsteps',1024);
        images = zeros(n_components,78,78);
        reduced_coefficients = coeff(:,1:n_components);
        for ici = 1:n_components
            ic_component = weights(:,ici);
            image = zeros(n_pixel,1);
            for pci = 1:n_components
                weight = ic_component(pci);
                image = image+weight*reduced_coefficients(:,pci);
            end
            mask = zeros(78*78,1);
            mask(ids) = image;
            images(ici,:,:) = reshape(mask,78,78);
        end
        all_images{end+1} = images;
    end
    save(['/N/slate/zw72/ICA_per_mice/Mouse_' num2str(mousei) '.mat'],'all_images')
end
