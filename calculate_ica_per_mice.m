function images = calculate_ica_per_mice(data_matrix)
    [pca_coeff,~,~,~,varience_explained,~] = pca(data_matrix');
    cumulative_explained = cumsum(varience_explained);
    n_components = sum(cumulative_explained<95);
    [ica_weights,~,~,~,~,~,~] = runica(pca_coeff(1:n_components,:),'extended',1,'maxsteps',1024);
    images = reconstruct_image_from_ics(pca_coeff,ica_weights);
end

function images = reconstruct_image_from_ics(coeff,weights)
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
end