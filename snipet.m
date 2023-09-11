mat = load('/N/slate/zw72/ICA_per_mice/Mouse_1.mat');
images = mat.all_images{end};
mat = load('/N/slate/zw72/average_per_mice_new/Mouse1.mat');
isbrain = mat.isbrain;

data = reshape(squeeze(mat.all_average_data(1,:,:,:)),[],2500);
ica_components = reshape(images,14,[])';

mat = laod('/N/slate/zw72/a')

%%
n_rows=5;
n_columns = 5;
ploti = -1;
n_components = size(images,1);
for ici = 1:n_components
    if mod(ici,n_rows*n_columns)==1
        f = figure();
        ha=tight_subplot(n_rows,n_columns,[0.03 0.03],[0.1 0.1],[0.1 0.1]);
        fhandle=gcf;
        set(gcf,'position',[1000,1000,1000,1000])
        ploti = ploti+1;
        sgtitle(['Mouse ' num2str(mice),' Time = P15'])
    end
    axis_id = ici-ploti*n_rows*n_columns;
    axis = ha(axis_id);
    hold(axis,'on')
    axes(axis)
    toplot = squeeze(images(ici,:,:));
    toplot(~mat.isbrain) = NaN;
    h = pcolor(toplot);
    set(h, 'EdgeColor', 'none');
    hold(axis,'off')
end
%%

mask = zeros(78,78);
mask(ids) = data_matrix(:,1);
imagesc(mask)

imagesc(~mat.isbrain)
imagesc(reshape(data_matrix(:,1),78,78))
figure

full_image = reshape(mat.all_average_data(time,:,:),[],2500);
imagesc(reshape(full_image(:,1),78,78))
imshowpair(reshape(full_image(:,1),78,78),mat.isbrain,"Scaling","independent");
imagesc(reshape(mean(full_image,2),78,78))