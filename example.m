function example(A, B, operation)   
    sld = uicontrol('Style', 'slider',...
    'Min',-50,'Max',150,'Value',0,...
    'Position', [20 20 300 20],...
    'Callback', @callback);

    % Add a text uicontrol to label the slider.
    sliderValue = get(sld,'Value');
    txt = uicontrol('Style','text',...
        'Position',[400 20 120 20],...
        'String', sliderValue);
     
    imshow(B);

    function callback(source, ~)
        t = source.Value / 100.0;
        set(txt, 'String', num2str(t));
        fprintf('Calculating %d \n', t);
        imshow(operation(A, B, t));
        fprintf('Done\n');
    end
end